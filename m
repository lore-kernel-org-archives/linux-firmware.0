Return-Path: <SRS0=3Kjn=QC=kufarabb.store=hirschkeshav@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7082CD3431
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 09:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BD28C4CED3; Wed,  4 Sep 2024 09:42:31 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2138.outbound.protection.outlook.com [40.107.222.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD378C4CEC8
	for <linux-firmware@kernel.org>; Wed,  4 Sep 2024 09:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD378C4CEC8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kufarabb.store
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kufarabb.store
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkXY9kygcZGlF3hH1nqweq+P2iQJY5Ztxpn8Iw5ufSGSCkOnGfNgu0wtiILEU3LtNsoHTSmTxDArBovvbuR/aE5xCyiJZLtIMZKJIBdaD1wXuT1Fo2/uUW3YOgV2FuUKtE1DQxAI9J4oOkU+gqPxKGSsmTudVxrJ3/rKp8cJiPAXDDT0I9dNsmSCPGJqu5UmdB+iUriUZMY3nysfJ5uxMrjJrb87BH61bZ8SWUmpIBouWZXXxnMN57NYIXhxQCnf2seS54W7+k7zPdXvHyVuYLIp6vgeSq6y+fUxQPwmU6oWojbqEuQ550yh1lDpTac5I6HIPboHwHa0hCEkjbyhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doiY142HE7YkLQyHMl8hiSoE2RHhNmnZeOpO6wZiOO8=;
 b=ToN18QODkGhs/mtHKmvDdupU93n2zsqCuhvqXVi/TC9S2xXLpTOpBszc69tQ3aeo2qAY9GXWWG+THiktFTu23XWcXQDbz67HZvwuYuAl4w8wpz+rwiTdRDfU2TUxmcxCThB7QywRJZCNiKjODCf0YYs2WUYDRfdvkh0ghMcb84h+KTcdUFUzThRRZSZU6bLPdBbHgGRxZhcAe152tAqwNyN/Zu5klvVyfI3EQBD6yYY/x7tvg45QOwTdy8BdmOv7QPe8gCTyGfGAM9krYbUQUfTq2nTSykUrD00sevuS3M81LrciCxk1MMRs0gxcF+k8WTrExgpSA+suvE5qrU/svw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kufarabb.store; dmarc=pass action=none
 header.from=kufarabb.store; dkim=pass header.d=kufarabb.store; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kufarabb.store;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doiY142HE7YkLQyHMl8hiSoE2RHhNmnZeOpO6wZiOO8=;
 b=WRdT4UZ/+Zo6gvFNNte1lRtlBLhM+t0xCMbhskLYBvJ5irz2qxzTQM+eCy89BcUIdiTnHXwpKqQ03c6dDRr1c1NFZg7XNsZseWGrqp87QWmHy+ax2vSWDc19gax87cORuwEEAtar6mhzFUgNjhbVKr79EBdASFYnwr/zvGYpw7loc0mPwk4p/1VlwIllHPIE2egA95/mG+T0gaNbOIQiP8//WXG1erVw/KYlwjbCv7diQg7K60ua+OePUfx4z8fgO/e5a0sjb0UBMR82Z6MciHAjwls8rJRsvvmqiQkv5G/xzv2rsdA7fWU+gakQRMo4bppIQCu6vzXc/C+dvSVgvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kufarabb.store;
Received: from PN3P287MB1607.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::6)
 by MAZP287MB0542.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 09:42:22 +0000
Received: from PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 ([fe80::96d5:cd12:f455:334d]) by PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 ([fe80::96d5:cd12:f455:334d%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:42:22 +0000
Content-Type: multipart/alternative;
 boundary="--_NmP-9e7501e5eeb0dfc7-Part_1"
Message-ID: <605f140c-65c6-4eb1-8393-458acbc22311@kufarabb.store>
From: Hirsch Keshav <hirschkeshav@kufarabb.store>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: I can help you boost conversions
Date: Wed, 04 Sep 2024 09:42:18 +0000
X-ClientProxiedBy: BLAPR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:208:32f::15) To PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1607:EE_|MAZP287MB0542:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ed0e54-6aed-4ed9-8207-08dcccc5e087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|586017|376014|1800799024|69100299015|366016|83080400003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnJPRWlXWjFZZFczdGZ1Rmk1a3ZxZm9ON3M5c2hzaHJzU2F0V0hKUWNoVDZk?=
 =?utf-8?B?UWI2dldOV1RjaWZRY0t2cWF6dWtUYlU3OUhxVjdVT2pkODRjenB4SFh4aWZC?=
 =?utf-8?B?MzhweVluTmNFRkpEVEI2R0Q2Nk9qaWgzYlJUNFlnazVYaDV0eGlzcVRBQXlX?=
 =?utf-8?B?LytYWEIrdDl2clIyUTNVeURRVTZxQyttSGw4dlE1bEVxcUdiVU1jZHJUWVdG?=
 =?utf-8?B?aHJZWHpWZ0pnS2dISU1QTThEbWtGblVZcUpzUWV4MFVHazRZdWdVaGJ1elRT?=
 =?utf-8?B?WnlnUS9LQzd1RXJLT29DWGxzemQraFk0UEpzUVdHaDZ3eTR1QWdiNXZHM1pV?=
 =?utf-8?B?NHpWeklBeXduT245MmdLM1FLeVJLY01oM3RPMVlDaFpSbXFrcWhza0dmWk1U?=
 =?utf-8?B?ZEp2ZjY5TzRGZWdEb1doeXh0ZVdESDhRSEp4M25kN2xPYzZWTFozbVliUDkr?=
 =?utf-8?B?Ky9vV3NaMStqL0haUmNpRUlKWFhYY1N5eEd0by9Ea3JGc1VOQXpLbHNRYmNl?=
 =?utf-8?B?ckZEY1I0dVJwTytUQ3dJYjd0c0lwR2grYWk0bGc3THpTUWFPaVUvMjFsQ2Zz?=
 =?utf-8?B?SlMzSWFwMVhOZFpaR0NOdGJSY2Z2cU9KZDhFU05CNTF3ZVdkaTZ2L1VRdFNm?=
 =?utf-8?B?S2hndUZXWU5mNHlOUmYvZ3dYOEVOS1Z3U3krcmtmaTVGMlYzNEVGZFcwblVJ?=
 =?utf-8?B?UkF2Vk1kcnVvRGR1ZnNSYXoybG1iOTNZTE5zbGV3VzcxV3ViRUlkNjZBd0Jp?=
 =?utf-8?B?ZlNrcmYwK0IyZjVaR0lDbWh4bk53SEVQSEpnd0UyVlF0LzVROEZsbFB4QWVi?=
 =?utf-8?B?VWNmR1RJdXROejJ2ejFTQXdvaDkxUjJZMS9BVDVqOEdtNjhWdXhjeFlWWnhF?=
 =?utf-8?B?eFZhRUdmOVdqNVBrV1ljQUtwQlFIZ3l6Y3pGdEovbXdqcUJmb256ZzJmeklD?=
 =?utf-8?B?M3pDNlowcjkvejVxOW9CNlRSVTVhV09ZT3BYTzVhUVE5YUhjTFVZaVNOMjhx?=
 =?utf-8?B?NmJ2QWRkS2pacm5wRjVFUkxXT0Z0QktCNnBjcHVINEt3a1N3VnVhRDlLeVlv?=
 =?utf-8?B?NFJWcS9TSFMrWFZONUI0aVAvSjRjT04rdFBCdzZhMlpLMUJzU2Q4bWtobDhL?=
 =?utf-8?B?Z1hNNlo2bzNkaEVlemIrVG02c2swMzdBQnA4bjV1a1h3cXVhV2g0aHFmY01h?=
 =?utf-8?B?WlE5RWFTazFiTnZzOU1lYWMrc3dhV0MraXpJT1B4LzNqTWpsZkpJbUx0eXlU?=
 =?utf-8?B?YWhLY0pPZlhTQzhES09uMFI0ZlNvQVZmeCtuZ2pUM2JucnZ1WHkvZXliQVFr?=
 =?utf-8?B?blJUeXZ0a0s2ZE5IdUtGcHMyRFZNN3ZHRnpXejV1dWhEV3ZoVkdpZndQQ1o1?=
 =?utf-8?B?RDlmdGFiMmhCRHliVi9YZEJBcUVXUURrbWJkL1B6cExtNS91OENIYWtkdmR5?=
 =?utf-8?B?a0c4TTRTQnIxMzRwMmVtZE45R2Vsbnh2Zk5qT2l6OHZ1ZkwzVlJ5djRWOG9L?=
 =?utf-8?B?dnRBVldUL0NNWkJ2QTRmQjd1VlFiODR1elpDbC9jbkNjUFpmS3BLSTZLQTlw?=
 =?utf-8?B?WlRjWks2aTR3QkNMdndGOFRCaWlhMWZOdzJya2lqRXNLQUNObmVsdWR5WUEv?=
 =?utf-8?B?cGI2R0N0aVFPaTZtN1M3eTFTZFVOakFJSTdsV3VFOFZSOFRsQS9pN1FNTklW?=
 =?utf-8?B?d24yaWx4LytPd1MxaGROQWdjNG9kbUZCRUhpMGxqWExLbkNuZlFQVnRYcW9N?=
 =?utf-8?B?cUJaK014TXZDVnFyVFd4WFNFUDBOYnhZNVQxNG5ESWFyMzZKR2s5bkxuMTNZ?=
 =?utf-8?Q?wCtunySaO3dtE6JoJ+U5zoWEzJr07yGMAo59Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1607.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(586017)(376014)(1800799024)(69100299015)(366016)(83080400003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENoL2Rad1hsOG9qTTRrRHVzdEdya21CSW1QcERtSGUvRnFkeGVzZjlBN0lE?=
 =?utf-8?B?T1JOWG9laS9Sc08zUGk2VURMOFVMVnMzYkdrTVFXYU1BNVc4QWNSNUJyU1BH?=
 =?utf-8?B?RnByU0lvTTVreFE4SXYvc1JIUHpPU0xJbjRHYzE3R2pWWFdTTmNyR09peUh6?=
 =?utf-8?B?SGhUMmsvMHpaVzdRTHYwUmpWWlUyN05aSVRtRmZrTGVVTU9Yb1V2cVFzNFM3?=
 =?utf-8?B?NDRlc05BcTlWaGl3QURIbzkydG1McXdIWDRjNDhFMFFhQzZPU0ZObHNuOHdu?=
 =?utf-8?B?RE4zMTY3aHJTaWZWcmZFRU16RHVLc0RFUy81MnNoYXQ5QUlPeXNhdjZ4dG10?=
 =?utf-8?B?bEVZRDJNNGZWTUVCa042dkEyN3E3a3ZPWGN5T0FuK1NBT1pUNkVleEViZGwy?=
 =?utf-8?B?SXZBdUVtbFVkTEdEVGMrT2t2K09vWTVjK0sxSEFTdVF1bEJKdWNHMVFvV0VT?=
 =?utf-8?B?WHZ2TDNwUjU0TDdpU2lzWG00VXNPR0dwYmh5WHIrSjlyV0xERmNiTFJaMjh2?=
 =?utf-8?B?QlJtdUFkTlA5ZFJJdzBBTzBFclp0YXVoSWFpVC9WTnBocDdGQjY2RWlHVlZH?=
 =?utf-8?B?RFBnejZibXB6V2M2K0hiL0JVblllc2l6Y0dVMTBORHNhMjV0Z2VnQVA5VDhU?=
 =?utf-8?B?Mi8zUWdpYnBvRDBlNFlxVDZTL0ZyQXhBVzJHY1dnQWtWdVA1RlJSd0JLLzhE?=
 =?utf-8?B?eVJScTlTSml1ZGtuamdjdEYyb3Joek5JN1BMYTdjVW81YngrMXg3K1BXTFFT?=
 =?utf-8?B?YWYvVjc3b3hDbWphUjlIY01ydnNja2tVQjN6NllLc1BNRmcyZUhNNVowUEg2?=
 =?utf-8?B?MFJuN1VVZFVFNXY4NjlMY0kzL0RvYVJFVkdOL05sYjFrMHdCV0JDSWlkUk5w?=
 =?utf-8?B?cFErTE55b0dlU0VSMUtTdnQ0SFZIODQrTVUrVG14RjNkTjhUWmd5Rll4RUly?=
 =?utf-8?B?RDlVK2NFaS95VnI3MmNTVEtPOE5kTTl4M0pMcURJRWRuU0Ivd1FCb3hRZDFD?=
 =?utf-8?B?WmowY1pmVWNwN2N2Z3lmRTlUR3NWVFVLS01RNGdFbWpUQzdVSUVEUk96K1Vx?=
 =?utf-8?B?Mkw5NERQQzZ1K1l6a3F1VzNQQkFuUzdrZHlGRGFwSkRnOTdjL1lpYUh3Y2N2?=
 =?utf-8?B?Zk5wL1N0K05NWkhaaTEzejFVZ0FVeE9RM2ZwYTVoRERXRDFqcXhUamNMYW1O?=
 =?utf-8?B?UWZHalNRcDY4Y0ErMEtjNVFoVFlRYktSc2cxaTVEcGxONnU5c3lVU3R3dkdn?=
 =?utf-8?B?WUJ2bC81QklIb3RjU1JhM3FibGxHUXhSK2srN0YxN2I3SkEwTEU1NnA4cWw0?=
 =?utf-8?B?LzVvSlFMdnlTUkdyT3F2TVNCZk1mM2YzaWliOWtQWVJBMmN0emtoaGlZY2VF?=
 =?utf-8?B?ckw4VEVqSDdpT3NLelIxMDU1VDFlQlcxMjlwMzY4QS9IZzFVa1BHQjZJTVlG?=
 =?utf-8?B?YnBoeElPVWVRdkI0NWMrV1NRazZpd3Uvbk9hMlZaK0Z3SWw2bnEySU10UCsv?=
 =?utf-8?B?RHlFSDhsaDBFM1dDUDVXQU94czlSNVQ2ZzlSWTJPenRxL01ES29IbU9YV0Ju?=
 =?utf-8?B?VUMzNkJ4MFhBNGhCK3hDY3pxS3d2Q1kvOFJKdWtheGtiOWd5a2NLeTN6MVJM?=
 =?utf-8?B?QmVzeGY4M2xwVUxxbFIrbXphenFNVjhCQVdkRmM4L3lEby9mUEU1cU5vanN0?=
 =?utf-8?B?Y3k5NTNqQ3libHlhTVZxZjFBWU81Z0tpaFpnVDZxMDFLbzF3NTBmS2VzZ1BR?=
 =?utf-8?B?ZUZQeTZmN2RvUEJ3cys3b1VobWRWV1cvQVBRViswcU55eUR4Y09Rek5jNE1n?=
 =?utf-8?B?OEgyYnBBYzA2VWZPVnlmNW8xVlpWTC9WQkhCTXZSVkM2eW01UEExM2x5ZUVl?=
 =?utf-8?B?TmpueGxRMW9oWlFGRjNVNDNJS3hhc2kwdlkxLys2SE9sSUI2d2Y5YjhiZlZT?=
 =?utf-8?B?S2JTNjdBLzNVYkdBSGdrcFhGUHNMU2xweko5d2ZJenlsRllSZXJVWC9TT0ZM?=
 =?utf-8?B?NTFLM1BrZjBZVHVyL2ZmRnZIQ3dsNnIzdUZmRWhyTC9WK21tdUxJZkZzc2N3?=
 =?utf-8?B?MU1QZ0xhRFFUSzhZZGRZbUFDdUpZa1MrNVl1aDlqNXBuRExhRXJqV2dVdjlm?=
 =?utf-8?B?Qmd2eGkvM2t2alBGTE9TVTlTVEt2NXNkdUJuNkNHTWJXQmd1dTIvS0k3dnNM?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: kufarabb.store
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ed0e54-6aed-4ed9-8207-08dcccc5e087
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1607.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 09:42:22.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9ec9e66c-90c2-4481-ba6d-6a197fdb6be2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ejt3WY4r2qywLJpvXAJk0qvQW5rD7CyWzns7UcObfSvnyhZu9d+NMn9g8VmMUfovmWvcwk7/lXsFNLCpQZF29s+XK12OGFkEdys2gTaKCT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0542

----_NmP-9e7501e5eeb0dfc7-Part_1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Redkey USB LTD, been trying to find your email lol. I know this is =
probably weird but I thought I'd reach out.

> =E2=81=A0I saw your product =
and I was wondering if I could help you get more conversions to drive =
adoption, free of charge just to get my name out there? I=E2=80=99m an app =
product manager + UI/UX designer and would love to see what I could do for =
your business!

> Hopefully this is something you're interested in... let =
me know if you're down to chat!


Good day,
Hirsch


P.S: My 3-minute video would put you 3 months ahead. I promise!


Sent from my iPhone


Quote of the day: Opportunities don't happen. You =
create them.

picture [https://inst.kufarabb.store/tmid_a/x2P47WKF1bwB8rDp2=
PxSJ] logo [https://inst.kufarabb.store/tmid_a/x2P47WKF1bwB8rDp2PxSJ]
----_NmP-9e7501e5eeb0dfc7-Part_1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv>Hi Redkey USB LTD, been trying to find your email lol. I know this is pr=
obably weird but I thought I'd reach out.</div><div style=3D"box-sizing: bo=
rder-box; font-family: Averta, sans-serif; color: rgb(65, 65, 65); font-siz=
e: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-ali=
gn: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;"><br>&gt; =E2=81=A0I saw your=
 product and I was wondering if I could help you get more conversions to dr=
ive adoption, free of charge just to get my name out there? I=E2=80=99m an =
app product manager + UI/UX designer and would love to see what I could do =
for your business!</div><div><br></div><div>&gt; Hopefully this is somethin=
g you're interested in... let me know if you're down to chat!</div><div sty=
le=3D"box-sizing: border-box; font-family: Averta, sans-serif; color: rgb(6=
5, 65, 65); font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: rgb(255, 255, 255); text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;"><br styl=
e=3D"box-sizing: border-box; font-family: Averta, sans-serif;"></div><div>G=
ood day,</div><div>Hirsch</div><div style=3D"box-sizing: border-box; font-f=
amily: Averta, sans-serif; color: rgb(65, 65, 65); font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-i=
ndent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 2=
55); text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;"><br style=3D"box-sizing: border-box; font-fa=
mily: Averta, sans-serif;"></div><div>P.S: My 3-minute video would put you =
3 months ahead. I promise!</div><div style=3D"box-sizing: border-box; font-=
family: Averta, sans-serif; color: rgb(65, 65, 65); font-size: 16px; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial;"><br style=3D"box-sizing: border-box; font-f=
amily: Averta, sans-serif;"></div><div>Sent from my iPhone</div><div style=
=3D"box-sizing: border-box; font-family: Averta, sans-serif; color: rgb(65,=
 65, 65); font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: left; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;=
 background-color: rgb(255, 255, 255); text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;"><br style=
=3D"box-sizing: border-box; font-family: Averta, sans-serif;"></div><div><e=
m><span style=3D"font-size: 12px;">Quote of the day: Opportunities don't ha=
ppen. You create them.</span></em></div>
<img alt=3D"" src=3D"https://inst.kufarabb.store/tmid_a/x2P47WKF1bwB8rDp2Px=
SJ">=

----_NmP-9e7501e5eeb0dfc7-Part_1--
