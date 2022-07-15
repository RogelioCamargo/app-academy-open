/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module) => {

eval("class Game {\n  constructor() {\n    this.towers = [[3, 2, 1], [], []];\n  }\n\n  isValidMove(startTowerIdx, endTowerIdx) {\n      const startTower = this.towers[startTowerIdx];\n      const endTower = this.towers[endTowerIdx];\n\n      if (startTower.length === 0) {\n        return false;\n      } else if (endTower.length == 0) {\n        return true;\n      } else {\n        const topStartDisc = startTower[startTower.length - 1];\n        const topEndDisc = endTower[endTower.length - 1];\n        return topStartDisc < topEndDisc;\n      }\n  }\n\n  isWon() {\n      // move all the discs to the last or second tower\n      return (this.towers[2].length == 3) || (this.towers[1].length == 3);\n  }\n\n  move(startTowerIdx, endTowerIdx) {\n      if (this.isValidMove(startTowerIdx, endTowerIdx)) {\n        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());\n        return true;\n      } else {\n        return false;\n      }\n  }\n\n  print() {\n      console.log(JSON.stringify(this.towers));\n  }\n\n  promptMove(reader, callback) {\n      this.print();\n      reader.question(\"Enter a starting tower: \", start => {\n        const startTowerIdx = parseInt(start);\n        reader.question(\"Enter an ending tower: \", end => {\n          const endTowerIdx = parseInt(end);\n          callback(startTowerIdx, endTowerIdx);\n        });\n      });\n  }\n\n  run(reader, gameCompletionCallback) {\n      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {\n        if (!this.move(startTowerIdx, endTowerIdx)) {\n          console.log(\"Invalid move!\");\n        }\n\n        if (!this.isWon()) {\n          // Continue to play!\n          this.run(reader, gameCompletionCallback);\n        } else {\n          this.print();\n          console.log(\"You win!\");\n          gameCompletionCallback();\n        }\n      });\n  }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack://hanoi_towers_jquery_project/./src/game.js?");

/***/ }),

/***/ "./src/hanoi-view.js":
/*!***************************!*\
  !*** ./src/hanoi-view.js ***!
  \***************************/
/***/ ((module) => {

eval("class View {\n\tconstructor(game, $el) {\n\t\tthis.game = game;\n\t\tthis.$el = $el;\n\t\tthis.fromTowerTdx = null;\n\n\t\tthis.$el.on(\"click\", \"ul\", this.clickTower.bind(this)); \n\n\t\tthis.setupTowers();\n\t\tthis.render();\n\t}\n\n\tclickTower(event) {\n\t\tconst clickedTowerIdx = $(event.currentTarget).index();\n\n\t\tif (this.fromTowerTdx === null) \n\t\t\tthis.fromTowerTdx = clickedTowerIdx; \n\t\telse {\n\t\t\tif (!this.game.move(this.fromTowerTdx, clickedTowerIdx))\n\t\t\t\talert(\"Invalid move! Try again.\"); \n\n\t\t\tthis.fromTowerTdx = null; \n\t\t}\n\n\t\tthis.render(); \n\n\t\tif (!this.game.isWon()) return; \n\n\t\tthis.$el.off(\"click\"); \n\t\tthis.$el.addClass(\"game-over\"); \n\t\talert(\"Good job!\"); \n\t}\n\n\tsetupTowers() {\n\t\tthis.$el.empty();\n\n\t\tlet $tower, $disk;\n\t\tfor (let i = 0; i < 3; i++) {\n\t\t\t$tower = $(\"<ul>\");\n\n\t\t\tfor (let j = 0; j < 3; j++) {\n\t\t\t\t$disk = $(\"<li>\");\n\t\t\t\t$tower.append($disk);\n\t\t\t}\n\t\t\tthis.$el.append($tower);\n\t\t}\n\t}\n\n\trender() {\n\t\tconst $towers = this.$el.find(\"ul\");\n\t\t$towers.removeClass();\n\n\t\t// simply displays bar \n\t\tif (this.fromTowerTdx !== null)\n\t\t\t$towers.eq(this.fromTowerTdx).addClass(\"selected\");\n\n\t\tthis.game.towers.forEach((disks, towerIdx) => {\n\t\t\tconst $disks = $towers.eq(towerIdx).children();\n\t\t\t$disks.removeClass();\n\n\t\t\tdisks.forEach((diskWidth, diskIdx) => {\n\t\t\t\t$disks.eq(-1 * (diskIdx + 1)).addClass(`disk-${diskWidth}`);\n\t\t\t});\n\t\t});\n\t}\n}\n\nmodule.exports = View; \n\n\n//# sourceURL=webpack://hanoi_towers_jquery_project/./src/hanoi-view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const HanoiGame = __webpack_require__(/*! ./game */ \"./src/game.js\"); \nconst HanoiView = __webpack_require__(/*! ./hanoi-view */ \"./src/hanoi-view.js\"); \n\n$(() => {\n  const rootEl = $('.hanoi');\n  const game = new HanoiGame();\n  new HanoiView(game, rootEl);\n});\n\n\n//# sourceURL=webpack://hanoi_towers_jquery_project/./src/index.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;