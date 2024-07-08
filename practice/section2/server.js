// in general, token secret must be in .env file
const ACCESS_TOKEN_SECRET = "ACCESS TOKEN SECRET";
const REFRESH_TOKEN_SECRET = "REFRESH TOKEN SECRET";
const PORT = 3000;

const express = require("express");
const cookieParser = require("cookie-parser");
const jwt = require("jsonwebtoken");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

const mockUser = {
    username: "yushin",
    password: "123",
    email: "kys010306@sogang.ac.kr",
};

// token payload information
const user = {
    username: mockUser.username,
    email: mockUser.email,
};

// expiresIn option: access token -> short, refresh token -> long
const accessOption = {
    expiresIn: "10m",
};

const refreshOption = {
    expiresIn: "1d",
};

const cookieOption = {
    httpOnly: true,
    sameSite: "Strict",
    secure: true,
    maxAge: 24 * 60 * 60 * 1000,
};

// authentication middleware
const isAuthenticated = (req, res, next) => {
    if (!req.headers.authorization) {
        return next("route");
    }

    let token = req.headers.authorization;
    if (token.startsWith("Bearer ")) {
        token = token.substring(7, token.length);
    }

    const auth = jwt.verify(token, ACCESS_TOKEN_SECRET, (err) => {
        if (err) return next("route");
    });
    if (auth) return next();
    else return next("route");
};

app.get("/", isAuthenticated, (req, res) => {
    return res.status(200).send("허용된 요청입니다.");
});

app.get("/", (req, res) => {
    return res.status(401).send("허용되지 않은 요청입니다.");
});

app.post("/login", (req, res) => {
    const { username, password } = req.body;
    if (username === mockUser.username && password === mockUser.password) {
        const accessToken = jwt.sign(mockUser, ACCESS_TOKEN_SECRET, accessOption);
        const refreshToken = jwt.sign(mockUser, REFRESH_TOKEN_SECRET, refreshOption);

        // cookie에는 refresh 토큰을 담고 이후 요청 시 access 토큰을 갱신한다
        res.cookie("jwt", refreshToken, cookieOption);
        return res.json({ accessToken, refreshToken });
    } else {
        return res.status(401).json({ message: "인증되지 않은 요청입니다." });
    }
});

// access 토큰 요청 전 refresh 토큰 요청을 먼저 한다
app.post("/refresh", (req, res) => {
    if (req.cookies.jwt) {
        const refreshToken = req.cookies.jwt;
        jwt.verify(refreshToken, REFRESH_TOKEN_SECRET, (err, decoded) => {
            if (err) {
                return res.status(401).json({ message: "인증되지 않은 요청입니다." });
            } else {
                const accessToken = jwt.sign(mockUser, ACCESS_TOKEN_SECRET, accessOption);
                return res.json({ accessToken });
            }
        });
    } else {
        return res.status(401).json({ message: "인증되지 않은 요청입니다." });
    }
});

app.listen(PORT, () => console.log("server is running at http://localhost:3000"));