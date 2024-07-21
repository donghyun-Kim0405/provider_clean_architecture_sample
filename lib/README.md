

# 구조

## core
해당 프로젝트에서 공통적으로 사용될것들
1. configs - 개발 환경 및 필요한 값들 (현재 임의로 프로젝트 내 )

## presentation
Clean Architecture Presentation Layer로 다음과같은 구조를 따름
1. routes - 화면상 보여질 페이지들
2. notifiers - view controller 로 화면상 보여질 페이지와 1:1 매칭 되는 구조

## domain
Clean Architecture Domain Layer로 다음과 같은 구조를 따름
1. repositories - data source를 다루는 추상화 repository를 정의
2. usecase - 캡슐화된 형태로 재사용이 가능한 비즈니스 로직을 처리할 usecase들

## data
Clean Architecture Data Layer로 다음과 같은 구조를 따름
1. req_dto - repository에서 요청시 사용할 dto
2. res_dto - repository에서 응답값들을 받을떄 처리할 dto
3. repositories - domain layer에서 작성한 repository들을 구현할 구현체들
4. mock - domain layer에서 작성한 repository들을 구현할 구현체들로, test case를 따로 작성하지 않고 실제 실행 환경에서 테스트를 할때 사용