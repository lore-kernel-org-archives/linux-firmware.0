Return-Path: <SRS0=jQ63=5W=fii-foxconn.com=li-yun.xiao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C20CDB462
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Nov 2025 00:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E25FC4CEFB; Fri, 14 Nov 2025 00:46:43 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012013.outbound.protection.outlook.com [52.101.126.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B28FCC4CEF5;
	Fri, 14 Nov 2025 00:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B28FCC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fii-foxconn.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fii-foxconn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU6J9Eua8qXf+irnfb5zsTVVHIyRdrO/HJ4vzhCazk+SVNHrniZh+tq6Wz+jGwjier+6A1UI5NaDaievuJLQL2A+YYJydJq7lHiHNNWr+CdzOuhbnZvABh0J4BNgrug7JGT4v60oVs7mOnutm7vXtFTrwLf/u/kn+G5qMb6G6gIDeMa/KpcXtCb2sX1CRmnpMWHpw4MSLMxD+pACe/xinqUShzlyVcjBhYpFf1ZDFsV9b/d+j45HqY9JUZfaX0a6tmM4i/Z4KcVlzwf0lSi1PdVwHI2x89OqseH2ErgNhfVZlMIbYddKmfJ52IvwVRvIC9GKCUSTiHNEKhMkdntzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO037M4b5mWxnfD8Noh6j520Ejyh8Oo7lpbjmAEtx2o=;
 b=TzJ0bW2MrIWuTeVWMmaZm8RCsbX3chd0LTaN5T0ucFxCGXXwXJV+FzkR142yYFMMZmhJ83zbUYCzkvk/ofL8ZFmV9jbt1Ju2MFrHho7JSj7gLWlZzx3cuKAw17X49FcQz7PEO12rMeK9ZIzSDqNmYsQ4ywZmeW65AjMrx/53dD4D+PtL40JDGujvheViLLakJVz9DAwIJnxALBsAI+0QmEZC2Dv+1oDZhoEDwZmLGuZjS8dGbj+Pe2sc5GwzLDfq/ycnQ8GlRSKQ5ZNexNIquNUJsaUd4uKhSPeH0DkyMsisYgLVkTu+8+zaKxJ3pvapb25KKbOaLz5WUie/VBTx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-foxconn.com; dmarc=pass action=none
 header.from=fii-foxconn.com; dkim=pass header.d=fii-foxconn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fii-foxconn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO037M4b5mWxnfD8Noh6j520Ejyh8Oo7lpbjmAEtx2o=;
 b=jfmXHrikDRMFldAhOfL0FU0F5nn6r8iu5X4luZM61pEhqi767AYvCUyFewCXsUi+2dFhq8TLuAaSPchBKytYnuXccO629+HqVJBkYlM75QsYXIlHBxvFdl6uk4s0E6B6AbHTyQMHKki6gFgP/3NcJM3LAEZ51zcFxzPDzrBNgdY41yG7mVErp7QVRn1mQzt8kpJur7F4n/+z6bs6z0LxYKE2go0b6O//peM4cr2FQ6F6tYngAnN2NZrv6G9X4T0WiTs+lQ+VYMReYC5RodqcA9kpuI7O+oAThQ0KJbUzJMLkgO103nL6XjtY4tlECxq3AzpjLc7o3dWxGGAsao2MtA==
Received: from TYZPR03MB6527.apcprd03.prod.outlook.com (2603:1096:400:1f8::13)
 by TYZPR03MB6472.apcprd03.prod.outlook.com (2603:1096:400:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 00:46:32 +0000
Received: from TYZPR03MB6527.apcprd03.prod.outlook.com
 ([fe80::2e3:e805:da00:49e4]) by TYZPR03MB6527.apcprd03.prod.outlook.com
 ([fe80::2e3:e805:da00:49e4%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:46:32 +0000
Received: from TYUPR03MB7137.apcprd03.prod.outlook.com (2603:1096:400:344::14)
 by TYSPR03MB7740.apcprd03.prod.outlook.com (2603:1096:400:416::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Thu, 13 Nov
 2025 11:05:37 +0000
Received: from TYUPR03MB7137.apcprd03.prod.outlook.com
 ([fe80::d806:f93a:62bc:1940]) by TYUPR03MB7137.apcprd03.prod.outlook.com
 ([fe80::d806:f93a:62bc:1940%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 11:05:37 +0000
From: =?gb2312?B?TGktWXVuIFhpYW8gKNCktlnUxik=?= <li-yun.xiao@fii-foxconn.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Slark Xiao <slark_xiao@163.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "mani@kernel.org" <mani@kernel.org>
CC: "slark.xiao@gmail.com" <slark.xiao@gmail.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIXSBxY29tOiBBZGQgc2R4MzUgRm94Y29ubiB2ZW5kb3Ig?=
 =?gb2312?Q?firmware_image_file?=
Thread-Topic: [PATCH] qcom: Add sdx35 Foxconn vendor firmware image file
Thread-Index: AQHcVIq/O+dwV5btW0WLGjPCaDU58rTwcGvH
Date: Thu, 13 Nov 2025 11:05:37 +0000
Message-ID:
 <TYUPR03MB71371479385703D0F2F6C511F8CDA@TYUPR03MB7137.apcprd03.prod.outlook.com>
References: <20251113104559.19111-1-slark_xiao@163.com>
In-Reply-To: <20251113104559.19111-1-slark_xiao@163.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?gb2312?B?TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0zNjkwYTEyMzFj?=
 =?gb2312?B?NTVfRW5hYmxlZD1UcnVlO01TSVBfTGFiZWxfNDRjY2YwNTktYWY1ZC00Yjky?=
 =?gb2312?B?LTkzMmQtMzY5MGExMjMxYzU1X1NpdGVJZD1jYjNkOGRjZC0yZWQyLTRiYWQt?=
 =?gb2312?B?ODlhNS1lMGE3MTk1ZmI2NDM7TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRi?=
 =?gb2312?B?OTItOTMyZC0zNjkwYTEyMzFjNTVfU2V0RGF0ZT0yMDI1LTExLTEzVDExOjA1?=
 =?gb2312?B?OjMzLjU4Mlo7TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0z?=
 =?gb2312?B?NjkwYTEyMzFjNTVfTmFtZT25q9PDKEdlbmVyYWwpO01TSVBfTGFiZWxfNDRj?=
 =?gb2312?B?Y2YwNTktYWY1ZC00YjkyLTkzMmQtMzY5MGExMjMxYzU1X0NvbnRlbnRCaXRz?=
 =?gb2312?B?PTE7TVNJUF9MYWJlbF80NGNjZjA1OS1hZjVkLTRiOTItOTMyZC0zNjkwYTEy?=
 =?gb2312?B?MzFjNTVfTWV0aG9kPVN0YW5kYXJkOw==?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-foxconn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 TYUPR03MB7137:EE_|TYSPR03MB7740:EE_|TYZPR03MB6472:EE_
x-ms-office365-filtering-correlation-id: 39d43d56-e58b-4d97-4da3-08de22a49319
x-ms-exchange-atpmessageproperties: SA
x-moderation-data: 11/14/2025 12:46:31 AM
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|39142699007|31052699007|1800799024|376014|366016|8096899003|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?U1B0OE9oK25GSjg2anMzajRtNHdxUkRpKzFFbjhhOXpKTzRCcHhESW8vTi9r?=
 =?gb2312?B?SnNTU09mNnpYTGtDMWdPakMxM0JIVGcwaXpKMDUyL0p0eU8zdmV2c1NEeWxF?=
 =?gb2312?B?czMzOUF0eXQ3c0p1bDk2TlpzeDBldU5jNTQ4VGNhdDZDTW1IaUUxbEpWQmxO?=
 =?gb2312?B?MnlxbjF4L1R4V1RReGFqZHkzSDBIeXZicVhOMjljLzJqTEt2YmNHUzJ4WGdm?=
 =?gb2312?B?SDRVaWdpTVc5K3FNYjh1dDJIcldHUEVrREkvZjRHc1ZoR2VZeXlCNkIwNkZ2?=
 =?gb2312?B?Y2dzdzU4T1pkMjFsU09oRXNCT3VwbjZicVVoWlBiNXpZTWc2V1RUVWJvaW55?=
 =?gb2312?B?TmRYV2VyRXc4cG0vZTh3dldwT25tM2ZZQVA1a21IL3pEeURMS1pZSUxHTXRM?=
 =?gb2312?B?VURWWHZGVktPclFXMEFyb1V5S2ZkUStpTVhCMUVneDV0NEoyVHptczJhZnJZ?=
 =?gb2312?B?SGphU2FMOUhLMXdMallBemgydDc4Z0xYWUl1dENQYmovZzh6OWUyUGxrUU9L?=
 =?gb2312?B?WmZEajBDWFZXR3lNaEd3SllSOHhlVHhRUGFBQU5WS2dPZFljakhTejEwZnFn?=
 =?gb2312?B?SWpISUZ1eGxVSDhFTDBxdTRoTVUzZCsyRkFYZThyU0xGdnZQZ2hLK2FEQys1?=
 =?gb2312?B?eGxKMUFETzViSSswNUNQbUpRN3NzellnZ2VyNy9jb3hZMXMyUGNQWTdId3Zt?=
 =?gb2312?B?ajlmSXpBSTVvNkVuN210ejJtMFVzVFpiVE9jdkRGUGg2akJ3UGo5b3gydEJ1?=
 =?gb2312?B?RDZDeXlRNTFLdHJXTllJVEVidE54YmNVbjRTZDRnV1BTc1I4ZVR3dzJPbFVQ?=
 =?gb2312?B?cUNQVzJEVnVGNGt4WXM0UC9kRHBERW1mY0ZvZENuaGpiY2JsQ1ZDRlZVbDdL?=
 =?gb2312?B?blJQZGk2QXdTU1hKTTBuSFUzT0hEQURqdU1Mcjd5aDBzdW9UNDh3RWV3UGpF?=
 =?gb2312?B?MHhmRDM5akZMUVFaWkwyY09CQjlKaGFYMmlZMzJZK1YySGpORGpmbHNqbVZi?=
 =?gb2312?B?RGsrSkpUYWR1bCtTclpTc3VnYUtIdi9kSXlOQ0h1TjRGM2hnWkpNME02Q3Ey?=
 =?gb2312?B?VlN3SzBsQzdBSHZIMVY4UzFxV2NTNnRSOTlVNmZiWEw2eHpPZVJMOE5MUjRJ?=
 =?gb2312?B?OUFEaGxaNURjYzhNbzUzaTEyamZ4NWMwZFMrZzBZL01mT2VNSkoyUUk5L0tq?=
 =?gb2312?B?VHNwV29NZ1cwY0NoSyt3ZnJ5ZlBzNXVUdXJraFFESG5YYk1yUzRWUzNzTDUw?=
 =?gb2312?B?VE1pQmpsWTBLSXpnKzBmbE9wQ1FjWkZxZkdTSHpmMkhZSjV5WERBNndiTTJW?=
 =?gb2312?B?VkJTWFJnUExwT0hweUFwK1FoKzFzSGF6S1B1dmhac2tTNjlLVlJPNXNRaGVu?=
 =?gb2312?B?eXprb1N3Z3c5aXhHYUhRZnhYcm1ZUWRveUJEVXB2STd0bGdPTDdPUlhvNTVv?=
 =?gb2312?B?U3FiRi9Bc2l6NVQ4OWlzcHltVmlKemQ3WEt1S2twbEw3UlpEYTFTcTFJZ0lm?=
 =?gb2312?B?dERLZDF6b2JDSlY0MzZpRWZIT1d6OVF1cUMra0tyUTc4SE5tZlcrU052aFlX?=
 =?gb2312?B?Z2Z2Ym03amJPNFRJdUlyOHVRYlRIaHk5T2U0WTVMaFg0Nkt0YmtxSTd2OU5v?=
 =?gb2312?B?aXFVKzJUN3hkaUxKcVlUVnY0VXVQc3k3UnJta28wS1J4MHdadE5JcHV5LzhX?=
 =?gb2312?B?MlhONGtTeWxJVXl5aG9oeTVYa0ZWbUI5RkdXdmtJOVNLSjI4QmpWeTZ5Vi9r?=
 =?gb2312?B?ZkErMTVqQjJ1VmZhb0xEMmVRYlhFQmcyVDhkaXFKYlV6c0dUazJzKzQ3SEZr?=
 =?gb2312?B?RWY3dU9MS1c5SEp5M0g2cmxRT0pjQ1hLWVcvMjZEckRReTBXSy9UYXJmc1B3?=
 =?gb2312?B?UFRVbHRQK2Ryd2FUQWdFUGRpK0N3T3E4MHM5NU9QRVhqOFA4cXE4ejFSTTNQ?=
 =?gb2312?B?OVFKNVZUaGk0T0pwYjdTOE0wQ2cyQmZiTnpDbzRBMnA5ektSckprd1lkc3pk?=
 =?gb2312?B?MlVpZHBZTTcwd0pjdHM4akZXWmZTTEE5UDMzaXVlTmlGRE9GMkN5NU1pQ0Nx?=
 =?gb2312?Q?0DbG9I?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6527.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(39142699007)(31052699007)(1800799024)(376014)(366016)(8096899003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UWtIQ1ZOQ1p5YVo1d3JJZHE2SzNpRG5xcDBEOHJxcm1zYXN1ZkxiQk1lYzF1?=
 =?gb2312?B?Zm5FbWV6dGRYU3hveUc0ZlA5Sm9SY2Y1SkNzeTVmQXcyMmV4Qk9xbytTY3ZS?=
 =?gb2312?B?REIxc2p5a21TaG5DeUJFSlQ1UldobXpRMWhnVjI2WEdSNXZlbmh0UzhPNXcv?=
 =?gb2312?B?ZXVIRXZ5UitpT3grb3FXY2czZjhiZ3RuemdUNHdqUFh0LzljZEU0Nm5nNysv?=
 =?gb2312?B?alpJNzhoOXBnK2FlZ3pVbDlXVkZBOFN4TmZQWDVvbXVvSWh1SE00THJWeUk3?=
 =?gb2312?B?UHlYcU14ZnFTeThMSWw3TFBNMXp0eHdvR01saVhSVFFTUWNGZ3Vtd2RQa25o?=
 =?gb2312?B?VjNvZ2VSMG52VG9IWUEzVmNiYUVHUWd3TktqZEgvckkwS01yQTY1cnFGelpy?=
 =?gb2312?B?b2hiek9IL29DdlRMMTR4dExXRTZDTVpJMWhxOVY2K0NhbWdWSzNaLzhhZlJ0?=
 =?gb2312?B?ZjZuUXRUUGxMcGhXU2dNQ2kwU3JlMVpkZUhUNXY5SkJkeS8zZXZNL2prR0U3?=
 =?gb2312?B?WHJERUZ5MThrUDY2b1JRV0dlRjUyME1wTFJsL0hFQ09ZTXladkpQTkZnem44?=
 =?gb2312?B?QmxYV2JGYWN0T2h6d0ZhVURkYU9WQTR1TjA3emlWVmV1Snl6TDU1YlJsQmRT?=
 =?gb2312?B?dGl6NFpxaVMzRG5MYTE5OEF4SjBFbmIzc2hrcUNQTEhYcEUrZWNKSmxnYlJT?=
 =?gb2312?B?aENYZFFXVTIxalIxc05udEZPZ1RTYnpRRTlDY3RNWHdZSTBMaUk0V0lxZEtk?=
 =?gb2312?B?cmlZMW0wMitBK3JHSHZTNW93SFI0SDdJdHAranJmSnlsbXcyTnE1Tk5Ibkg1?=
 =?gb2312?B?L2Joam1JazgrOUN6U0lVN0Q3NGg3ejdWTk1pR2cxTm54RG5lTGhNcXlvM2hJ?=
 =?gb2312?B?MjYweFNEcVArK1JvN2d5SHQ3Um8yYjJFb0Mzc291V2pseDZYdzVxN2hkSDNl?=
 =?gb2312?B?aUFlU29QdVV6NFJoeENXektxNWJ2NlJGaVVPcGxSNGg5cmlrdnpqR0dRN1J3?=
 =?gb2312?B?ejhYcDViV3pRditQQ09QMkhxanBVUFllV29zRHBNelR2ZHdKdEZ4V01ES3Rp?=
 =?gb2312?B?RjB1TDNXZE0wR0NXOFBiUWhFR0tkVmRudTB3QmpUZ2hObkljMCs3MDZxa0M1?=
 =?gb2312?B?OEFCRmN3SlZucHdPdkRxUWplNXI2QlovWjFEaHlKMUdqN2w1TENvRGUyenV1?=
 =?gb2312?B?cDRxc0lxb2dQMVFBSzRVdFR5SGxIdkVGS2haTHhNanJlRVQ1MDIrd1R2VlY3?=
 =?gb2312?B?cmRobVZ5VW0xZjNqRXpJc0puUU1QM1VTYnlwUXFIZ05halVhOTc3RWN2OUll?=
 =?gb2312?B?aEtyRXc0bHV2TWFRcCsvV1Azbkh5V3d2eUZkazE5ZjJQQzNBN1BBanNvZHFI?=
 =?gb2312?B?b1FDR01rblZ2cnFDd1EvbUVWVWtwVldnVnRHVlAzb1R1V3VoNDVRaTNUN25v?=
 =?gb2312?B?K1U0amxzY0VKWE9vMW1qU3VKYTRhRFV4T1pvYkFiMHFlQkk3d0RON1NDdytr?=
 =?gb2312?B?YzVjSG1YOWswZkcyRi9xRHBvUFhVL2JTZzdRbk5aR2RMekNpNnpUWmZyYTRZ?=
 =?gb2312?B?b1llcnJ4b1ZNSUJ0N0FKLzlpdjhLc1NuYyt6T0NCc3VXTHVCSVRIaU1jL21p?=
 =?gb2312?B?QkZ2V2ovdEp2Q0d5VzBsN3A3ZTJiT3JpTS9vZFVrN1FCMXpOb0tGMTVBTS80?=
 =?gb2312?B?VXZJVHpiY1NXT2Y3akdZMTkzTGJGT25qT2VsSXJFVEMxTC9Rd3RWRU5tMkxJ?=
 =?gb2312?B?Y09VcFIwQjFmekwwdGZJRHhrQ1NVdzdNRHh6T3A5ZEExTy9CUk1XRk5sSFVC?=
 =?gb2312?B?T0s1a0ExVkVrd2dxYkh3eEhRamRqUkg3NUpjZ0NQUFdIL2NGYVBKNjB1Q1Vq?=
 =?gb2312?B?M3JXeTJEcUVLZ1Vob2RNM3o4OGpnbGdONGdtVFJDMHhGZ0VVbWRwcEM5OVAr?=
 =?gb2312?B?VzVIWVVFNDdzUy85dEJxam5pUzFVenhrVFg5UzFzYjVPKy9BVDF5bW1nTmdH?=
 =?gb2312?B?SWJLdG5IWlpQUkFHOEExRm1NV25UbzBsdGlEVzJKeU40V2pSd3dCYkpwUmUy?=
 =?gb2312?B?cTU4bURnbmpFNSt1aXRBaTVIUi9ENklCNGtaOTNQdFUrSlVvRXZzQmlJeGNZ?=
 =?gb2312?Q?RtDtATqajOm/MdEFroAso/jDL?=
Content-Type: multipart/alternative;
	boundary="_000_TYUPR03MB71371479385703D0F2F6C511F8CDATYUPR03MB7137apcp_"
MIME-Version: 1.0
X-OriginatorOrg: fii-foxconn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR03MB7137.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d43d56-e58b-4d97-4da3-08de22a49319
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cb3d8dcd-2ed2-4bad-89a5-e0a7195fb643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rug+ew67agNmtV02rqUrxZuhk6KFiTp2yUi893fAatjAkgTDtcjumGUbb3uT4dbLst1BPskzO7IHVf4N7nZoS4Z5hgmT03AQ5YiKSK9crEw=
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 00:46:32.3416
 (UTC)
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6472

--_000_TYUPR03MB71371479385703D0F2F6C511F8CDATYUPR03MB7137apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgLA0KVGhpcyBpcyBGb3hjb25uIHNpZGUuIEJvdGggc2xhcmsueGlhb0BnbWFpbC5jb20gYW5k
DQpzbGFya194aWFvQDE2My5jb20gYmVsb25nIHRvIG1lLg0KVGhpcyBmaXJtd2FyZSBiZWxvbmdz
IHRvIEZveGNvbm4gU0RYMzUgZGV2aWNlLg0KDQpUaGFua3MNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQq3orz+yMs6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4NCrei
y83KsbzkOiAyMDI1xOoxMdTCMTPI1SAxODo0NQ0KytW8/sjLOiBsaW51eC1maXJtd2FyZUBrZXJu
ZWwub3JnIDxsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnPjsgbWFuaUBrZXJuZWwub3JnIDxtYW5p
QGtlcm5lbC5vcmc+DQqzrcvNOiBzbGFyay54aWFvQGdtYWlsLmNvbSA8c2xhcmsueGlhb0BnbWFp
bC5jb20+OyBMaS1ZdW4gWGlhbyAo0KS2WdTGKSA8bGkteXVuLnhpYW9AZmlpLWZveGNvbm4uY29t
PjsgU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPg0K1vfM4jogW1BBVENIXSBxY29tOiBB
ZGQgc2R4MzUgRm94Y29ubiB2ZW5kb3IgZmlybXdhcmUgaW1hZ2UgZmlsZQ0KDQpFeHRlcm5hbCBl
bWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KDQpGb3IgTUhJ
IG1vZGVtcywgaXQgZGVmaW5lcyBhbiBlZGwgZmlybXdhcmUgaW4ga2VybmVsIGRyaXZlcnMvYnVz
Lw0KbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBmaWxlLiBBY2NvcmRpbmcgdG8gdGhlIHJlcXVpcmVt
ZW50IG9mIE1ISQ0KZHJpdmVyIG1haW50YWluZXIsIHdlIHNoYWxsIGNvbW1pdCB0aGlzIGZpcm13
YXJlIGJlZm9yZSBjb21taXRpbmcNCmtlcm5lbCBkcml2ZXIgc3VwcG9ydC4NClNpbmNlIGRpZmZl
cmVudCB2ZW5kb3IgdXNlIGRpZmZlcmVudCBmaXJtd2FyZXMsIHNvIHdlIGFkZCBhDQp2ZW5kb3Ig
c3ViLWZvbGRlciB1bmRlciBxY29tL3NkeDM1Lg0KU2ltaWxhciBjb21taXQgcGxlYXNlIHJlZmVy
IHRvIHFjb20vc2R4NjEvZm94Y29ubi4NCg0KU2lnbmVkLW9mZi1ieTogU2xhcmsgWGlhbyA8c2xh
cmtfeGlhb0AxNjMuY29tPg0KLS0tDQogV0hFTkNFICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA2ICsrKysrKw0KIHFjb20vc2R4MzUvZm94Y29ubi94Ymxfc19kZXZwcmdfbnMu
bWVsZiB8IEJpbiAwIC0+IDEzNjUyMjAgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBxY29tL3NkeDM1L2ZveGNvbm4veGJsX3NfZGV2
cHJnX25zLm1lbGYNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCrTL
tefX09PKvP68sMbkyM66zri9vP6/ycTcyse7+sPctcSjrMbkxNrI3b32uanWuLaoytW8/sjLyrnT
w6Gjyc/K9tDFz6Kx7bTvtcTIzrrOudu14732tPqx7bj2yMvS4rz7o6yyorK70ru2qLT6se2xvrmr
y77WrsGis6Gho8j0xPrS8s6qzvO0q7b4ytW1vbG+08q8/qOsx+vBory00tTTyrz+zajWqrzEvP7I
y6OssqK9q7G+08q8/sm+s/2ho7371rm9q7G+08q8/rvyxuS4vbz+uLTWxqGi16q3oqGiyaKyvLvy
0tTIzrrO0M7KvdC5wrbP8sjOus7Iy824wra0y8/7z6K1xMTayN2ho7G+08q8/r6t08kgSW50ZXJu
ZXQgtKu13aOszt63qLGj1qS159fT08q8/rXEzerV+9DUus2wssir0NSjrNPKvP7T0L/JxNzU4rTc
uMS78rKhtr7I68fWoaPOqsi3saPXytG21q6wssiro6y9qNLpytW8/sjLx+u+zbG+08q8/rywuL28
/tau1tjSqsTayN2jrNPrvMS8/sjLvfjQ0Mi3yM8NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCg0KVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHRvIGl0IG1heSBiZSBj
b25maWRlbnRpYWwgYW5kIGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGlu
ZGl2aWR1YWwgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIEFueSB2aWV3cyBvciBvcGluaW9ucyBl
eHByZXNzZWQgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgbmVjZXNz
YXJpbHkgcmVwcmVzZW50IHRob3NlIG9mIEZJSS1Gb3hjb25uIEluZHVzdHJpYWwgSW50ZXJuZXQu
IElmIHlvdSBoYXZlIHJlY2VpdmVkIGl0IGJ5IG1pc3Rha2UsIHBsZWFzZSBpbmZvcm0gdGhlIHNl
bmRlciBieSBhbiBlbWFpbCByZXBseSBhbmQgdGhlbiBkZWxldGUgdGhlIG1lc3NhZ2UuIEl0IGlz
IGZvcmJpZGRlbiB0byBjb3B5LCBmb3J3YXJkLCBvciBpbiBhbnkgd2F5IHJldmVhbCB0aGUgY29u
dGVudHMgb2YgdGhpcyBtZXNzYWdlIHRvIGFueW9uZS4gVGhlIGludGVncml0eSBhbmQgc2VjdXJp
dHkgb2YgdGhpcyBlbWFpbCBjYW5ub3QgYmUgZ3VhcmFudGVlZCBvdmVyIHRoZSBJbnRlcm5ldC4g
VGhlcmVmb3JlLCBpdCdzIGFkdmlzZWQgZm9yIHRoZSByZWNlaXZlciB0byB2ZXJpZnkgdGhlIHZh
bGlkaXR5IG9mIHRoaXMgbWVzc2FnZSB3aXRoIHRoZSBzZW5kZXIuDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo=

--_000_TYUPR03MB71371479385703D0F2F6C511F8CDATYUPR03MB7137apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi ,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This is Foxconn side. Both slark.xiao@gmail.com&nbsp;and&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
slark_xiao@163.com&nbsp;belong to me.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This firmware belongs to Foxconn SDX35 device.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;Slark Xiao &lt;slark_xiao@163.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2025=C4=EA11=D4=C213=C8=D5 18:45<br>
<b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;linux-firmware@kernel.org &lt;linux-firmwar=
e@kernel.org&gt;; mani@kernel.org &lt;mani@kernel.org&gt;<br>
<b>=B3=AD=CB=CD:</b>&nbsp;slark.xiao@gmail.com &lt;slark.xiao@gmail.com&gt;=
; Li-Yun Xiao (=D0=A4=B6Y=D4=C6) &lt;li-yun.xiao@fii-foxconn.com&gt;; Slark=
 Xiao &lt;slark_xiao@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b>&nbsp;[PATCH] qcom: Add sdx35 Foxconn vendor firmware i=
mage file</div>
<div style=3D"direction: ltr;" class=3D"elementToProof">&nbsp;</div>
<div style=3D"direction: ltr; font-size: 11pt;" class=3D"elementToProof">Ex=
ternal email: Use caution opening links or attachments<br>
<br>
For MHI modems, it defines an edl firmware in kernel drivers/bus/<br>
mhi/host/pci_generic.c file. According to the requirement of MHI<br>
driver maintainer, we shall commit this firmware before commiting<br>
kernel driver support.<br>
Since different vendor use different firmwares, so we add a<br>
vendor sub-folder under qcom/sdx35.<br>
Similar commit please refer to qcom/sdx61/foxconn.<br>
<br>
Signed-off-by: Slark Xiao &lt;slark_xiao@163.com&gt;<br>
---<br>
&nbsp;WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
6 ++++++<br>
&nbsp;qcom/sdx35/foxconn/xbl_s_devprg_ns.melf | Bin 0 -&gt; 1365220 bytes<b=
r>
&nbsp;2 files changed, 6 insertions(+)<br>
&nbsp;create mode 100644 qcom/sdx35/foxconn/xbl_s_devprg_ns.melf<br>
<br>
<br>
<br>
</div>
</div>
<hr>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
10pt; color: rgb(0, 0, 0);">
<small>=B4=CB=B5=E7=D7=D3=D3=CA=BC=FE=BC=B0=C6=E4=C8=CE=BA=CE=B8=BD=BC=FE=
=BF=C9=C4=DC=CA=C7=BB=FA=C3=DC=B5=C4=A3=AC=C6=E4=C4=DA=C8=DD=BD=F6=B9=A9=D6=
=B8=B6=A8=CA=D5=BC=FE=C8=CB=CA=B9=D3=C3=A1=A3=C9=CF=CA=F6=D0=C5=CF=A2=B1=ED=
=B4=EF=B5=C4=C8=CE=BA=CE=B9=DB=B5=E3=BD=F6=B4=FA=B1=ED=B8=F6=C8=CB=D2=E2=BC=
=FB=A3=AC=B2=A2=B2=BB=D2=BB=B6=A8=B4=FA=B1=ED=B1=BE=B9=AB=CB=BE=D6=AE=C1=A2=
=B3=A1=A1=A3=C8=F4=C4=FA=D2=F2=CE=AA=CE=F3=B4=AB=B6=F8=CA=D5=B5=BD=B1=BE=D3=
=CA=BC=FE=A3=AC=C7=EB=C1=A2=BC=B4=D2=D4=D3=CA=BC=FE=CD=A8=D6=AA=BC=C4=BC=FE=
=C8=CB=A3=AC=B2=A2=BD=AB=B1=BE=D3=CA=BC=FE=C9=BE=B3=FD=A1=A3=BD=FB=D6=B9=BD=
=AB=B1=BE=D3=CA=BC=FE=BB=F2=C6=E4=B8=BD=BC=FE=B8=B4=D6=C6=A1=A2=D7=AA=B7=A2=
=A1=A2=C9=A2=B2=BC=BB=F2=D2=D4=C8=CE=BA=CE=D0=CE=CA=BD=D0=B9=C2=B6=CF=F2=C8=
=CE=BA=CE=C8=CB=CD=B8=C2=B6=B4=CB=CF=FB=CF=A2=B5=C4=C4=DA=C8=DD=A1=A3=B1=BE=
=D3=CA=BC=FE=BE=AD=D3=C9 Internet =B4=AB=B5=DD=A3=AC=CE=DE=B7=A8=B1=A3=D6=
=A4=B5=E7=D7=D3=D3=CA=BC=FE=B5=C4=CD=EA=D5=FB=D0=D4=BA=CD=B0=B2=C8=AB=D0=D4=
=A3=AC=D3=CA=BC=FE=D3=D0=BF=C9=C4=DC=D4=E2=B4=DC=B8=C4=BB=F2=B2=A1=B6=BE=C8=
=EB=C7=D6=A1=A3=CE=AA=C8=B7=B1=A3=D7=CA=D1=B6=D6=AE=B0=B2=C8=AB=A3=AC=BD=A8=
=D2=E9=CA=D5=BC=FE=C8=CB=C7=EB=BE=CD=B1=BE=D3=CA=BC=FE=BC=B0=B8=BD=BC=FE=D6=
=AE=D6=D8=D2=AA=C4=DA=C8=DD=A3=AC=D3=EB=BC=C4=BC=FE=C8=CB=BD=F8=D0=D0=C8=B7=
=C8=CF</small></p>
<hr>
<p style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
10pt; color: rgb(0, 0, 0);">
<small>This email and any attachments to it may be confidential and are int=
ended solely for the use of the individual to whom it is addressed. Any vie=
ws or opinions expressed are solely those of the author and do not necessar=
ily represent those of FII-Foxconn
 Industrial Internet. If you have received it by mistake, please inform the=
 sender by an email reply and then delete the message. It is forbidden to c=
opy, forward, or in any way reveal the contents of this message to anyone. =
The integrity and security of this
 email cannot be guaranteed over the Internet. Therefore, it's advised for =
the receiver to verify the validity of this message with the sender.</small=
></p>
<hr>
</body>
</html>

--_000_TYUPR03MB71371479385703D0F2F6C511F8CDATYUPR03MB7137apcp_--
