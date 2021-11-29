const menu = document.querySelector('.card-menu');
const article = document.querySelector('.article-insert');
let previousArtcile;
const backButton = document.querySelector('.back-button');
function changeMenu(){

    const headerMenuItem = document.querySelectorAll('.header-menu_item');
    let menuName;

    function showMenu(name){
        menu.innerHTML = menus.get(name);
        console.log(name);
    }

    function selectMenu(){
        headerMenuItem.forEach(item =>{
            item.classList.remove('active-card');
        });
        this.classList.add('active-card');
        menuName = this.getAttribute('data-tab-name');
        showMenu(menuName);
        initArticle(menuName);
        changeArticle();
        changeTab();
    }

    headerMenuItem.forEach(item =>{
        item.addEventListener('click', selectMenu);
    })
}
function changeArticle() {

    const articlesMenuItem = document.querySelectorAll('.article-menu_item');

    let articleName;

   function showArticle(name){
        article.innerHTML = articles.get(name);
        document.getElementsByClassName('tabs')[0].getElementsByTagName('button')[0].click();
        console.log(name)
   }

    function selectArticle() {
        articlesMenuItem.forEach(item =>{
            item.classList.remove('active-article-menu-item');
        });
        this.classList.add('active-article-menu-item');
        articleName = this.getAttribute('data-tab-name');
        showArticle(articleName);
        getLink();
        changeTab();
        getLinkTab();
    }

    articlesMenuItem.forEach(item =>{
       item.addEventListener('click', selectArticle);
    });
}

function changeTab(){
    const listItem = document.querySelectorAll(".menu_item");
    const content = document.querySelectorAll('.article-content');
    let tabName;

    function selectContent(tabName){
        content.forEach(item =>{
            item.classList.contains(tabName)? item.classList.add('active-article-content'): item.classList.remove('active-article-content');
        });
    }

    function selectItem(){
        listItem.forEach(item =>{
            item.classList.remove('active-item')
        });
        this.classList.add('active-item');
        tabName = this.getAttribute('data-tab-name');
        selectContent(tabName);
    }

    listItem.forEach(item=>{
        item.addEventListener('click', selectItem);
    });
}

function initArticle(menuName){
    article.innerHTML = initialArticles.get(menuName);
}

function getLink(){
    const links = document.querySelectorAll('.link');
   console.log(links);
    let linkName;


    function goToTheLink(){
        linkName = this.getAttribute('data-tab-name');
        previousArtcile = this.getAttribute('current-article');
        console.log(linkName);
        console.log(previousArtcile);
        showArticleFromTheLink(linkName);

    }

    function showArticleFromTheLink(name){

        article.innerHTML = articles.get(name);
        backButton.classList.add('visible');
        changeTab();
    }

    links.forEach(item =>{
        item.addEventListener('click', goToTheLink);
    });
}

function back(){
    function returnArticle(){
        article.innerHTML = articles.get(previousArtcile);
        backButton.classList.remove('visible');
        changeTab();
        getLink();
    }

    backButton.addEventListener('click', returnArticle);
}

function getLinkTab(){
    const linktabs = document.querySelectorAll('.linkTab');
    let  linkTabName;

    function showArticleFromLinkTab(name){
        article.innerHTML = articles.get(name);
    }

    function goLinkTab(){
        linkTabName = this.getAttribute('data-tab-name');
        showArticleFromLinkTab(linkTabName);
        changeTab();
        getLinkTab();
        getLink();
        back();
    }

    linktabs.forEach(item => {
        item.addEventListener('click', goLinkTab);
    })
}
