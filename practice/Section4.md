# Section 4. 데이터베이스

## 데이터베이스의 기본 #1. Entity, Relation, Attribute, Domain

![note](../notes/section4/DB1.jpg)

<details>
<summary>Q1. Weak entity와 Strong entity의 차이점이 무엇인가요?</summary>

weak entity는 독립적으로 존재할 수 없고, strong entity에 의존적인 entity입니다. 때문에 보통 자기 자신의 primary key를 가지지 않고 관계된 strong entity의 primary key를 참조합니다. 반면, strong entity는 독립적으로 존재할 수 있고, 자기 자신의 primary key를 갖는 entity입니다.

strong entity의 예를 학생, 교과목으로 든다면, 이와 관련된 weak entity의 예는 수강신청과 같은 것이 있습니다. 학생이 없다면 수강신청도 불가능할 것입니다.

</details>

<details>
<summary>Q2. Relation이란 무엇인가요?</summary>

relation은 데이터베이스에 정보를 저장하기 위한 기본 단위로, 데이터베이스에 올라온 entity를 의미합니다. RDBMS에서는 table이라고 부르고 record들이 저장됩니다. NoSQL(MongoDB)에서는 collection이라고 부르고 document들이 저장됩니다.

</details>

<details>
<summary>Q3. Relation의 attribute, domain은 무엇인가요?</summary>

attribute는 relation을 구분할 수 있는, 고유한 이름을 가진 구체적 정보를 의미합니다. 예를 들어 학생 relation의 attribute는 이름, 나이, 성별 등이 있을 수 있습니다. domain은 이러한 attribute들이 가질 수 있는 값의 집합을 의미합니다. 예를 들어 성별은 {male, female}이라는 값 집합 안에서 그 값이 결정됩니다.

</details>