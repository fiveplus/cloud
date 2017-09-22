package com.cloud.util;

import io.rong.ApiHttpClient;
import io.rong.models.ChatroomInfo;
import io.rong.models.FormatType;
import io.rong.models.GroupInfo;
import io.rong.models.ImgMessage;
import io.rong.models.SdkHttpResult;
import io.rong.models.TxtMessage;
import io.rong.models.VoiceMessage;

import java.io.IOException;
import java.util.List;

public class RongAPI {
	
	private RongAPI(){}
	
	private static final String RONGYUN_KEY = PropertiesUtil.getValue("RONGYUN_KEY");
	private static final String RONGYUN_SEC = PropertiesUtil.getValue("RONGYUN_SEC");
	
	
	/**
	 * 获取Token
	 * @param userId 用户Id
	 * @param userName 用户昵称
	 * @param portraitUri 用户头像URI
	 * @return
	 * @throws IOException 
	 */
	public static SdkHttpResult getToken(Integer userId, String userName,
			String portraitUri){
		return ApiHttpClient.getToken(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), userName,
				portraitUri, FormatType.json);
	}

	public static SdkHttpResult sendStringMessage(String message,
			Integer userId, List<String> toIds){
		return ApiHttpClient.publishMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), toIds,
				new TxtMessage(message), FormatType.json);
	}

	public static SdkHttpResult sendVoiceMessage(String message, Long duration,
			Integer userId, List<String> toIds){
		return ApiHttpClient.publishMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), toIds,
				new VoiceMessage(message, 100L), FormatType.json);
	}

	public static SdkHttpResult sendImageMessage(String message,
			String imageUri, Integer userId, List<String> toIds) {
		return ApiHttpClient.publishMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), toIds,
				new ImgMessage(message, imageUri), FormatType.json);
	}

	public static SdkHttpResult sendPushData(String message,
			String pushContent, String pushData, Integer userId,
			List<String> toIds){
		return ApiHttpClient.publishMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), toIds,
				new TxtMessage(message), "pushContent", "pushData",
				FormatType.json);
	}

	public static SdkHttpResult sendSystemMessage(String message,
			String pushContent, String pushData, Integer userId,
			List<String> toIds){
		return ApiHttpClient
				.publishSystemMessage(RONGYUN_KEY,
						RONGYUN_SEC, userId.toString(), toIds,
						new TxtMessage(message), pushContent, pushData,
						FormatType.json);
	}

	public static SdkHttpResult createChatRoom(List<ChatroomInfo> chats) {
		return ApiHttpClient.createChatroom(RONGYUN_KEY,
				RONGYUN_SEC, chats, FormatType.json);
	}

	public static SdkHttpResult queryChatRoom(List<String> chatIds){
		return ApiHttpClient.queryChatroom(RONGYUN_KEY,
				RONGYUN_SEC, chatIds, FormatType.json);
	}

	public static SdkHttpResult sendChatRoomMessage(String message,
			Integer userId, List<String> chatIds) {
		return ApiHttpClient.publishChatroomMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), chatIds,
				new TxtMessage(message), FormatType.json);
	}

	public static SdkHttpResult destoryChatRoom(List<String> chatIds){
		return ApiHttpClient.destroyChatroom(RONGYUN_KEY,
				RONGYUN_SEC, chatIds, FormatType.json);
	}

	public static SdkHttpResult syncGroup(Integer userId, List<GroupInfo> groups){
		return ApiHttpClient.syncGroup(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), groups,
				FormatType.json);
	}

	public static SdkHttpResult joinGroup(Integer userId, Integer groupId,
			String groupName){
		return ApiHttpClient.joinGroup(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), groupId
						.toString(), groupName, FormatType.json);
	}

	public static SdkHttpResult joinGroupBatch(List<String> userIds,
			Integer groupId, String groupName){
		return ApiHttpClient.joinGroupBatch(RONGYUN_KEY,
				RONGYUN_SEC, userIds, groupId.toString(),
				groupName, FormatType.json);
	}

	public static SdkHttpResult sendGroupMessage(String message,
			String content, String data, Integer userId, List<String> chatIds){
		return ApiHttpClient.publishGroupMessage(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), chatIds,
				new TxtMessage(message), content, data, FormatType.json);
	}

	public static SdkHttpResult quitGroup(Integer userId, Integer groupId){
		return ApiHttpClient.quitGroup(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), groupId
						.toString(), FormatType.json);
	}

	public static SdkHttpResult quitGroupBatch(List<String> userIds,
			Integer groupId){
		return ApiHttpClient.quitGroupBatch(RONGYUN_KEY,
				RONGYUN_SEC, userIds, groupId.toString(),
				FormatType.json);
	}

	public static SdkHttpResult dismissGroup(Integer userId, Integer groupId){
		return ApiHttpClient.dismissGroup(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), groupId
						.toString(), FormatType.json);
	}

	public static SdkHttpResult getMessageHistoryUrl(String date){
		return ApiHttpClient.getMessageHistoryUrl(RONGYUN_KEY,
				RONGYUN_SEC, date, FormatType.json);
	}

	public static SdkHttpResult blockUser(Integer userId, Integer minutes){
		return ApiHttpClient.blockUser(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), minutes,
				FormatType.json);
	}

	public static SdkHttpResult queryBlockUsers() {
		return ApiHttpClient.queryBlockUsers(RONGYUN_KEY,
				RONGYUN_SEC, FormatType.json);
	}
	
	public static SdkHttpResult unblockUser(Integer userId){
		return ApiHttpClient.unblockUser(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), FormatType.json);
	}
	
	public static SdkHttpResult checkOnline(Integer userId){
		return ApiHttpClient.checkOnline(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), FormatType.json);
	}
	
	public static SdkHttpResult blackUser(Integer userId,List<String> toBlackIds){
		return ApiHttpClient.blackUser(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(), toBlackIds,FormatType.json);
	}
	
	public static SdkHttpResult QueryblackUser(String userId){
		return ApiHttpClient.QueryblackUser(RONGYUN_KEY,
				RONGYUN_SEC, userId.toString(),FormatType.json);
	}
	
	public static SdkHttpResult deleteMessageHistory(String date){
		return ApiHttpClient.deleteMessageHistory(RONGYUN_KEY,
				RONGYUN_SEC, date,FormatType.json);
	}
	
	public static SdkHttpResult refreshGroupInfo(Integer groupId,String groupName){
		return ApiHttpClient.refreshGroupInfo(RONGYUN_KEY,
				RONGYUN_SEC, groupId.toString(), groupName,
				FormatType.json);
	}
}
