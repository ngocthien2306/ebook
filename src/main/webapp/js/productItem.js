/**
 * 
 */
window.addEventListener("load", () => {
	let index = 0;
	const items = document.querySelectorAll(".recommendItem");
	const indicators = document.querySelectorAll(".indicator");
	const nextBtn = document.querySelector(".nextBtn");
	const prevBtn = document.querySelector(".prevBtn");
	const changeSlide = () => {
		items.forEach((el) => el.removeAttribute("id"));
		if (index === items.length) index = 0;
		if (index < 0) index = --items.length;
		items[index].id = "active";
	};
	const nextSlide = () => {
		changeSlide(index++);
	};
	const prevSlide = () => {
		changeSlide(index--);
	};
	indicators.forEach((el, i) =>
		el.addEventListener("click", () => changeSlide((index = i)))
	);
	nextBtn.addEventListener("click", nextSlide);
	prevBtn.addEventListener("click", prevSlide);
	setInterval(nextSlide, 2000);
});