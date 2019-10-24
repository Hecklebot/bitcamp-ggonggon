<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <style>
        .photo2 {
         height: 120px;
        }
   
        .search-utility-hero[data-photo-lightness="dark"] .advanced-search:after {
            background-repeat: no-repeat;
            background-size: contain;
            height: 1em;
            width: .7em;
            content: "";
            display: inline-block;
            position: relative;
            top: 1px;
            vertical-align: baseline;
            background-position: 100% 0%;
            margin-left: .5rem
        }

        .search-utility-hero[data-photo-lightness="dark"] .advanced-search:after {
            background-image: url("data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgNzAgMTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik03MCA1MC44NTlMMCAwbDIxLjU4IDUwLjg1OUwwIDEwMHoiIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==")
        }

        .search-utility-hero .search-utility-hero-form:hover,
        .search-utility-hero .search-utility-hero-form {
            background-color: transparent;
            background-position: 50% 50%;
            background-repeat: no-repeat;
            background-size: contain
        }

        .show-search-button:hover,
        .search-utility-hero .search-utility-hero-form:hover {
            background-image: url("data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgNDIgNDIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTQwLjgxIDM1LjMybC05Ljk4Ni05Ljk4NWExNi4yNiAxNi4yNiAwIDAgMCAyLjM3My04LjQ4NUMzMy4xOTcgNy44MjIgMjUuMzc0IDAgMTYuMzQ1IDAgNy4zMiAwIDAgNy4zMiAwIDE2LjM0N2MwIDkuMDI4IDcuODIyIDE2Ljg1IDE2Ljg1IDE2Ljg1IDMgMCA1LjgxMi0uODE0IDguMjMtMi4yMjZsMTAuMDM3IDEwLjA0YTIuNTE0IDIuNTE0IDAgMCAwIDMuNTU3IDBsMi40OS0yLjQ5Yy45ODMtLjk4Mi42MjctMi4yMi0uMzU1LTMuMnpNNS4wMyAxNi4zNDZjMC02LjI1IDUuMDY3LTExLjMxNyAxMS4zMTUtMTEuMzE3IDYuMjUgMCAxMS44MiA1LjU3IDExLjgyIDExLjgyUzIzLjEgMjguMTY3IDE2Ljg1IDI4LjE2N2MtNi4yNSAwLTExLjgyLTUuNTctMTEuODItMTEuODJ6IiBmaWxsPSIjMzMzIi8+PC9zdmc+")
        }

        .search-utility-hero .search-utility-hero-form {
            background-image: url("data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgNDIgNDIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTQwLjgxIDM1LjMybC05Ljk4Ni05Ljk4NWExNi4yNiAxNi4yNiAwIDAgMCAyLjM3My04LjQ4NUMzMy4xOTcgNy44MjIgMjUuMzc0IDAgMTYuMzQ1IDAgNy4zMiAwIDAgNy4zMiAwIDE2LjM0N2MwIDkuMDI4IDcuODIyIDE2Ljg1IDE2Ljg1IDE2Ljg1IDMgMCA1LjgxMi0uODE0IDguMjMtMi4yMjZsMTAuMDM3IDEwLjA0YTIuNTE0IDIuNTE0IDAgMCAwIDMuNTU3IDBsMi40OS0yLjQ5Yy45ODMtLjk4Mi42MjctMi4yMi0uMzU1LTMuMnpNNS4wMyAxNi4zNDZjMC02LjI1IDUuMDY3LTExLjMxNyAxMS4zMTUtMTEuMzE3IDYuMjUgMCAxMS44MiA1LjU3IDExLjgyIDExLjgyUzIzLjEgMjguMTY3IDE2Ljg1IDI4LjE2N2MtNi4yNSAwLTExLjgyLTUuNTctMTEuODItMTEuODJ6IiBmaWxsPSIjYTFhMWExIi8+PC9zdmc+")
        }

        html,
        body,
        div,
        span,
        a,
        img,
        strong,
        fieldset,
        form {
            margin: 0;
            padding: 0;
            border: 0;
            font: inherit;
            font-size: 100%;
            vertical-align: baseline
        }

        html {
            box-sizing: border-box;
        }

        * html {
            font-size: 100%
        }

        body {
            background: #fff;
            position: relative;
        }

        @media only screen and (max-width: 640px) {
            body {
                -webkit-text-size-adjust: none;
                -ms-text-size-adjust: none;
                width: 100%;
                min-width: 0
            }
        }

        html,
        body {
            height: 100%
        }

        img {
            max-width: 100%;
            height: auto
        }

        strong {
            font-weight: 700;
            line-height: inherit
        }

        button {
            border: none
        }

        button:focus {
            outline: 0
        }

        button:hover {
            cursor: pointer
        }

        .field .input {
            position: relative;
            padding: 0 .625rem;
            background: #fff;
            border: 1px solid #d8d8d8
        }

        img.photo,
        .photo-wrap img {
            max-width: none
        }
        
             input {
            border:none;
            padding: 0;
            background-color: transparent;
            height: 3.75rem;
            width: 37.5rem;
            text-align: center;
              border-radius: 0;
        }


        [class$="-form"] {
            background-color: #fff;
            display: block;
            margin: 0 auto;
            padding: 2rem 0;
            width: 100%;
            z-index: 1
        }

        [class$="-form"] fieldset,
        [class$="-form"] p {
            border: none;
            margin: 0;
            padding: .5rem 2rem
        }


        .search-utility-hero {
            background-color: #f1f2f2;
            background-position: 0 0;
            background-repeat: no-repeat;
            background-size: cover;
            height: 25.75rem;
            line-height: 1;
            margin: 0 0 1rem;
            position: relative;
            text-align: center
        }

        .search-utility-hero ::selection {
            background-color: transparent
        }

        .search-utility-hero .find-a-recipe,
        .search-utility-hero .search-utility-hero-form,
        .search-utility-hero .advanced-search {
            display: block;
            position: relative;
            z-index: 1
        }

        .search-utility-hero .find-a-recipe {
            font: bold 2.1875rem/2.875rem "Source Serif Pro", serif;
            display: inline-block;
        }

        .search-utility-hero .find-a-recipe:focus,
        .search-utility-hero .find-a-recipe:hover {
            cursor: default
        }

        .search-utility-hero .search-utility-hero-form {
            background-color: rgba(255, 255, 255, 0.75);
            background-position: 11px 50%;
            background-size: 21px 21px;
            height: 2.8125rem;
            padding: 0;
            width: 82%
        }

        .search-utility-hero .search-utility-hero-form:hover {
            background-color: rgba(255, 255, 255, 0.75);
            background-position: 11px 50%;
            background-size: 21px 21px;
            cursor: pointer
        }

        .search-utility-hero .search-utility-hero-form fieldset {
            display: none
        }

        .search-utility-hero .advanced-search {
            font: bold .75rem/.75rem "Renner", sans-serif;
            display: inline-block;
            margin-top: 2.1875rem;
            text-transform: uppercase;
            letter-spacing: 1px
        }

        .search-utility-hero .photo-wrap {
            display: block;
            height: 100%;
            left: 0;
            overflow: hidden;
            position: absolute;
            top: 0;
            width: 100%
        }

        .search-utility-hero .photo-wrap .photo,
        .search-utility-hero .photo-wrap img {
            height: 100%;
            position: relative;
            left: 50%;
            -webkit-transform: translate(-50%, 0);
            -ms-transform: translate(-50%, 0);
            transform: translate(-50%, 0)
        }

        .search-utility-hero[data-photo-lightness="dark"] .find-a-recipe,
        .search-utility-hero[data-photo-lightness="dark"] .advanced-search {
            color: #fff
        }


        @media only screen and (min-width: 768px) {
            .search-utility-hero {
                height: 30.375rem
            }

            .search-utility-hero .find-a-recipe {
                font-size: 4.125rem;
                margin: 9.25rem auto 1.8125rem;
                padding: 0
            }

            .search-utility-hero .search-utility-hero-form {
                background-position: 14px 50%;
                background-size: 27px 27px;
                height: 3.75rem;
                width: 29.125rem
            }

            .search-utility-hero .search-utility-hero-form:focus,
            .search-utility-hero .search-utility-hero-form:hover {
                background-position: 14px 50%;
                background-size: 27px 27px
            }

            .search-utility-hero .advanced-search {
                margin-top: 1.5rem
            }
        }

        @media only screen and (min-width: 1024px) {
            .search-utility-hero {
                margin: 0 0 2.25rem
            }
            .search-utility-hero .search-utility-hero-form {
                width: 37.5rem
            }
        }

    </style>
    <title>Recipe List</title>
</head>
<body>

<span class="page-wrap" id="page-mount-point"><span class="page">
                    <div class="search-utility-hero" data-photo-lightness="dark" data-track-location="above-the-fold" data-track-source="page-region"><strong class="find-a-recipe">Find a Recipe</strong>
                        <form action="/search/" autocomplete="off" class="search-utility-hero-form" method="get" data-reactid="62">
                            <div>검색<input type='text' name='keyword'>
                       </div>
                        </form><a class="advanced-search" href="/search/" title="Advanced Search">Advanced Search</a>
                            <div class="photo-wrap">
                                <picture class="component-responsive-image photo-wrap">
                                    <source media="(min-width: 1400px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_1944,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_3888,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 1024px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_1458,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_2916,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 768px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_1094,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_2188,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 0px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_1236,h_824,c_limit/61-bread_16042018.jpg 2x" /><img alt="61-bread_16042018.jpg" src="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg" title="" /></picture>
                            </div>
                    </div>
                </span>
            </div>
            </div>
        </span></span>

<h1>레시피 목록</h1>
<a href='form'>레시피 등록</a></br>

<table>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>대표사진</th>
</tr>

<c:forEach items="${recipes}" var="recipe">
  <tr>
    <td>${recipe.no}</td>
    <td><a href='detail?no=${recipe.no}'>${recipe.title}</a></td>
    <td><img src='/upload/recipe/${recipe.thumbnail}' class='photo2'></td>
  </tr>
</c:forEach>

<form action='search'>
    FIND RECIPE : <input type='text' name='keyword'>
  <button>검색</button>
</form>
</table>

<script>

</script>

</body>
</html>