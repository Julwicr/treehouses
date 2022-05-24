class CookieBar {
  constructor() {
    this.cookiesBar = document.getElementById('cookies-bar');
  }

  init() {
    if (this.cookiesAllowed()) {
      this.appendGACode();
    }

    this.addButtonBehaviors();
  }

  cookiesAllowed() {
    return Cookies.get('allow_cookies') === 'yes';
  }

  addButtonBehaviors() {
    if (!this.cookiesBar) {
      return;
    }

    this.cookiesBar.querySelector('.accept').addEventListener('click', () => this.allowCookies(true));

    this.cookiesBar.querySelector('.reject').addEventListener('click', () => this.allowCookies(false));
  }

  appendGACode() {
    const ga = "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){" +
      "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o)," +
      "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)" +
      "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');" +
      "ga('create', 'UA-XXXXX-Y', 'auto');" + "ga('send', 'pageview');";

    document.getElementsByTagName('head')[0].append('<script>' + ga + '</script>');
  }

  allowCookies(allow) {
    if (allow) {
      Cookies.set('allow_cookies', 'yes', {
        expires: 365
      });

      this.appendGACode();
    } else {
      Cookies.set('allow_cookies', 'no', {
        expires: 365
      });
    }

    this.cookiesBar.classList.add('hidden');
  }
}

window.onload = function() {
  const cookieBar = new CookieBar();

  cookieBar.init();
}
