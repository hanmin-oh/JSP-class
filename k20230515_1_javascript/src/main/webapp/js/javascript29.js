//	onload 이벤트에서 함수를 할당한다. 
//	현재 페이지의 모든 내용이 브라우저에 로딩되고 난 후 onload에 할당한 함수가 실행된다.
onload = function() {
	// alert('꺄~~~~~~~~~~~~~~~');
	// button 태그를 찾아서 onclick 이벤트에 함수를 할당한다.
	// 이벤트에 함수를 할당할 때 함수 이름뒤에 ()를 쓰면 자동 실행 함수로 인식되어 페이지가 로딩될 때
	// 자동으로 실행되기 때문에 자동으로 실행하면 안되는 함수에는 함수 이름뒤에 ()를 쓰지 않는다.
	
	document.getElementsByTagName('button')[0].onclick = testDate1;
	//document.getElementsByTagName('button')[1].onclick = testDate2;
	document.querySelectorAll('button')[1].onclick = testDate2;
	document.querySelectorAll('button')[2].onclick = testDate3;
	document.querySelectorAll('button')[3].onclick = testDate4;
	document.querySelectorAll('button')[4].onclick = testDate5;
}

function testDate1() {
	let date = new Date();
	console.log(date);
	let today = document.getElementById('today');
	today.innerHTML = date;
	today.innerHTML = date.toDateString();
	today.innerHTML = date.toLocaleString(); // 2023. 5. 22. 오후 1:13:53
	today.innerHTML = date.toLocaleDateString(); // 2023. 5. 22.
	today.innerHTML = date.toLocaleTimeString(); // 오후 1:15:06
}

function testDate2() {
	let date = new Date();
	console.log(date);
	
	//let year = date.getYear() + 1900;
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	let week = date.getDay();
	let hour = date.getHours();
	let minute = date.getMinutes();
	let second = date.getSeconds();	
	let milliSecond = date.getMilliseconds(); //밀리초
	
	const weekDay = ['일' , '월' , '화' , '수' , '목' , '금' , '토'];
	let now = `${year}.${month}.${day}.(${weekDay[week]}) ${hour}:${minute}:${second}.${milliSecond}`;
	console.log(now);
	
	let today = document.getElementById('today');
	today.innerHTML = now;
	
}

function testDate3() {
	let year = 2023;
	let month = 5;
	let day = 22;
	
	//Date 객체를 만들 때 인수로 년, 월, 일, 시, 분, 초를 넣어주면 날짜를 만들 수 있다.
	//Date(년, 월, 일)
	let date = new Date(year, month -1, day);
	console.log(date);
	//document.getElementById('specific').innerHTML = date;
	document.querySelectorAll('#inputDate').value = date;
	
	//Date(년, 월, 일, 시, 분, 초)
	date = new Date(year, month - 1, day, 15, 4, 42);
	console.log(date);
	document.querySelector('#inputDate').value = date;
}

function testDate4() {
	//지정 날짜를 얻어온다.
	let date1 = document.getElementById('date1').value;
	console.log(date1);
	document.querySelectorAll('#dateInput').value = date1;
	
	// 얻어온 지정 날짜는 string 타입의 데이터이므로 날짜 연산을 하기 위해서
	// 날짜 데이터로 만든다.
	let date = new Date(date1);
	console.log(date);
	console.log(typeof date);
	
	// 경과 날짜를 알려준다.
	let dateInput = document.getElementById('dateInput').value;
	console.log(dateInput);
	console.log(typeof dateInput);
	
	// setDate() : 날짜를 수정한다.
	console.log(date.getDate() + parseInt(dateInput) -1);
	date.setDate(date.getDate() + parseInt(dateInput) -1);
	console.log(date);
	console.log(date.toLocaleDateString());
	document.getElementById('result').value = date.toLocaleDateString();
	
}

function testDate5() {
	// 수료 날짜를 얻어온다.
	let date2 = document.getElementById('date2').value;
	let endDate = new Date(date2);
	
	// 지정 날짜를 얻어온다.
	let dateInput2 = document.getElementById('dateInput2').value;
	let startDate = new Date(dateInput2);
	
	// 수료 날짜에서 지정 날짜를 뺀다.
	let result2 = endDate - startDate;
	// 날짜 시간 데이터를 연산하면 두 시간 데이터 연산 결과를 밀리초 단위로 계산
	//console.log(result2);
	console.log(result2 / (24 * 60 * 60 * 1000) + 1);
	document.getElementById('result2').value = (result2 / (24 * 60 * 60 * 1000) + 1);
	
}




















