function showTab(tabId) {
  // Hide all tabs
  const tabs = document.querySelectorAll(".tab-content");
  tabs.forEach((tab) => {
    tab.style.display = "none";
  });

  // Show the selected tab
  const selectedTab = document.getElementById(tabId);
  selectedTab.style.display = "block";
}

// Optional: Automatically show the first tab
document.addEventListener("DOMContentLoaded", () => {
  showTab("tab1");
});
