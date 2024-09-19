/**
 * 
 */
 
 const categoryMap = {
    1: "강아지",
    2: "고양이",
    3: "기타 포유류",
    4: "파충류/양서류",
    5: "어류",
    6: "조류",
    7: "설치류",
    8: "절지류/곤충"
};

function getCategoryName(categoryNo) {
    return categoryMap[categoryNo] || "Unknown Category";
}

document.addEventListener("DOMContentLoaded", function() {
    const categorizedPosts = window.categorizedPosts; // 전역 변수를 통해 데이터를 가져옴

    categorizedPosts.forEach(function(entry) {
        const categoryElement = document.getElementById(`category-${entry.key}`);
        if (categoryElement) {
            categoryElement.textContent = `Category ${getCategoryName(entry.key)}`;
        }
    });
});