const slime = {
	name: '슬라임'
}

const cuteSlime = {
	name: '슬라임',
	attribute : 'cute'
}

const purpleCuteSlime = {
	name: '슬라임',
	attribute : 'cute',
	color : 'purple'
}

console.log(slime);
console.log(cuteSlime);
console.log(purpleCuteSlime);
console.log('================================');

// ... => spread 연산자 => ES6에서 추가 => 객체의 내용을 다른 객체에 퍼뜨린다. 확산시킨다.
const slime2 = {
	name: '슬라임'
}

const cuteSlime2 = {
	...slime2, 
	attribute : 'cute'
}

const purpleCuteSlime2 = {
	... cuteSlime2,
	color : 'purple'
}

console.log(slime2);
console.log(cuteSlime2);
console.log(purpleCuteSlime2);
console.log('================================');

//spread연산자는 배열에도 사용할 수 있다.
const animals = ['개' , '고양이' , '참새'];
console.log(animals);
const animals2 = animals.concat('비둘기');
console.log(animals2);
const animals3 = [...animals2, '까치']
console.log(animals3);

//push() , unshift()는 배열에 데이터를 추가하고 데이터가 추가된 배열의 length를 리턴한다.
const animals4 = animals.push('닭');
console.log(animals);
console.log(animals4);
const animals5 = animals.unshift('닭');
console.log(animals);
console.log(animals5);



























