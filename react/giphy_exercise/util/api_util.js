import { GIPHY_API_KEY } from "./api_util_constants";

export const fetchSearchGiphys = (searchTerm) =>
	$.ajax({
		type: "GET",
		url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${GIPHY_API_KEY}&limit=2`,
	});
