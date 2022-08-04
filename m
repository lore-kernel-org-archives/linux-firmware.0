Return-Path: <SRS0=m480=YI=lenovo.com=markpearson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDCDC19F2B
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Aug 2022 11:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8464EC433B5; Thu,  4 Aug 2022 11:53:45 +0000 (UTC)
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18437C433D7;
	Thu,  4 Aug 2022 11:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18437C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lenovo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
	s=Selector; t=1659614023; i=@lenovo.com;
	bh=XdgclON8N4q8Ne5B4JeB1VIZ7L2SxaiZKPirCV2X2os=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=HzivBpgDD+psgczyInZe5UA16Q9aKfH5RzS2La27bygJWWHFq8/l3yNd9t6HIyXD/
	 QtwT6IUzWwzz0R2WU8sUqJCX1GjNMXN9aogEEzNtoNJEwrmxjd2QybGbFtNx/jSby6
	 LRMV12KAwn58Zo6HOzhAOyTosa0gvpmyv9erXZ1HoAces5L+5BvV+FJh+rMeSpHOLA
	 c6mRQzyyIbcntaME9NIlnm7NeApfArCcjAzYpfXBuo4X6edoL7D71VqZ7iZsz7W5HL
	 R2zGPv6Ll1MYgDB5ztA/Q/ywL5CqeDOJFGBoHxp5sTILZI+6n4ElXjX8PonQ1tyUZ+
	 gwcuKdecZ5J7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRWlGSWpSXmKPExsWSoZ+npeu2+XW
  SQecnLYvT+9+xWFx7nmtxYLmNA7PHplWdbB53ru1hC2CKYs3MS8qvSGDNmLa4l62gSbKi+e4p
  1gbG0yJdjFwcjAJLmSUWXJnDAuEsYpX4tmMyM4TTySSx5cp0dhBHSGAuk8TahutsEM4hJonH7
  afAeiQEjjNKdB9axwSR6WSU+PEKIiMkMJFJYsrLz1ADHjNKrJvzAyrzkFGi+eYuIIeTg1fAVm
  Ljtg4wm0VARWLj5U5miLigxMmZT8DiogIREg8fTQKzhQXcJZ7vusQEYjMLiEvcejIfzBYRUJZ
  Y1jYHqJcDKG4r0dQaDLGrmVHiyINXYL1sAtoSW7b8YgOxOQUCJQ48uQ01R1OidftvdghbXmL7
  2zlgNwgBzfzVfx7MlhBQkFj16zsjhJ0g0TzlKJQtKXHt5gV2CFtW4ujZOSwQtq/EscZzTBC2r
  sTKY7eg4nISp3ph4vISOzfeZpnAqDMLycuzkLw2C8l5s5Cct4CRZRWjVVJRZnpGSW5iZo6uoY
  GBrqGhia6ZOZDSS6zSTdQrLdZNTSwu0TXSSywv1kstLtYrrsxNzknRy0st2cQITEMpRc7cOxh
  /rfypd4hRkoNJSZQ3u/11khBfUn5KZUZicUZ8UWlOavEhRhkODiUJXpv1QDnBotT01Iq0zBxg
  SoRJS3DwKInwZq4FSvMWFyTmFmemQ6ROMdpzXNm2dy8zx4MTJ4Hk1StXgOS19Qv2MQux5OXnp
  UqJ8+puAmoTAGnLKM2DGwpL4ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMWgtzGk5lXAr
  f7FdBZTEBn6XC9ADmrJBEhJdXAJPfGcvGkz8si+6p3r/PZH958X81K7aNPYQN3/xaRj4b6J7Y
  bbOfnttrKuouLM03+lvSxJM8H7Fsn9TJXHFj6yGvFbLs27wuKnKZ+5you++ZLLL9+WcH9xSa2
  lqBn8SyhHrcrFq/6bX7pZ5+i9yVDSf0MRXmuzdcWRQRJuUq98JPsuR+uwZt23rvuyvtp/G0JW
  xry3x7iPNWndePx8eMHTecb175dWjrhgBWrde7J1u0eedsWTJ1i0z7ruU7G2g2ikbby6yR/ss
  9ZtNpXYi/L9y3VkQeTkh+ePfa+7EXyVfa67IuKgmmTOJ4GlKgETf1Vdkxsa7LZ7tcPV2RuqxB
  bxGO6WsNIJaRZa3X+w1xHJZbijERDLeai4kQA0OHvSlwEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-22.tower-715.messagelabs.com!1659614021!10198!1
X-Originating-IP: [104.47.110.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15237 invoked from network); 4 Aug 2022 11:53:42 -0000
Received: from mail-tyzapc01lp2042.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.42)
  by server-22.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Aug 2022 11:53:42 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGbQrXfzOH1T9gVMWMmVqGEmoqEtztX4M4sXQgexk3ZlIlJBFCg63ymUG3OKRHdkr/xE/4sD4etlLWuL7RPpSOB41cS6G7b7WEnpAsG1fNvfiWOasv/skR66UuSb3a+SQn4u6b4mfDJkN+pNP1MH2rKyMp8XEcrtfP2mtn6MbX38QjgC1iFOG+AdXY3tLqvFO7uWrPXcQ/2niMmSl1De3nqR3mMsMIjieCyDRsURapmYV6iEMZjfFWb80DesyAOqvHP0YBeBJekp8v//sa2+t/s3NWIzccfmhSpgZwKgi/ji4KectNGFhQwm4kDlrSSQggQAgFXfwVTavpOfFPy0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdgclON8N4q8Ne5B4JeB1VIZ7L2SxaiZKPirCV2X2os=;
 b=Ca1gcUyMd5lRY5UsLwRqGFFzuX6t16/Wc0BKCaUOfCJJCm+Fzd8D4LvQ+X0jHA6uoAmPao6wtLaVMXhzjCGlYhlcDycwe/R53tm1JoGUaCLETwuwECI489tPYLi0BM1CVB1wkRiuFpdiqMudTpoY+ZKYthGH1Y8b4J3gqwBKEtpYCR/PjOkrntubXMM29iFcc75a8SSuFSHicTUQu+KQof0lSYQE8c8Y/nl2rR8J/dpNK8jtmF145noHGliV8GxpSPsbR6OdJsA36CSLZ+aKMV50MNqwYGlva4v+zz9WKwuyRMMIAjByGuav1EwpuV4Zu+g2oeTgbb+XygDcYzSPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TY2PR04CA0020.apcprd04.prod.outlook.com (2603:1096:404:f6::32)
 by KL1PR03MB5094.apcprd03.prod.outlook.com (2603:1096:820:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 11:53:40 +0000
Received: from TYZAPC01FT039.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:f6:cafe::fd) by TY2PR04CA0020.outlook.office365.com
 (2603:1096:404:f6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Thu, 4 Aug 2022 11:53:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 TYZAPC01FT039.mail.protection.outlook.com (10.118.152.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 11:53:39 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Thu, 4 Aug
 2022 07:53:37 -0400
Received: from [10.46.215.48] (10.46.215.48) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Thu, 4 Aug
 2022 07:53:37 -0400
Message-ID: <c0fcdd91-ad52-0c69-4f6b-343cc8c8da56@lenovo.com>
Date: Thu, 4 Aug 2022 07:53:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [External] Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <bjorn.andersson@linaro.org>
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <CA+5PVA6NCSn6ZsVELY0-mW9v82n6Xro2eVkMAcx=LppgMMC2UQ@mail.gmail.com>
From: Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <CA+5PVA6NCSn6ZsVELY0-mW9v82n6Xro2eVkMAcx=LppgMMC2UQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.215.48]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a95b64f-b760-4358-8a7a-08da760ff8c3
X-MS-TrafficTypeDiagnostic: KL1PR03MB5094:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1dNRlFZTWx5a0NNc2ZGQjdvd3lwa3hyZE9LbUtEZXlhZ1JOaUZHSThpZFBO?=
 =?utf-8?B?c095M2txWWdlNlg3Z3F1M0RDcXJhVCtaenR4MmloRHp6endKYUx6NTduT0tU?=
 =?utf-8?B?VHpOWjZ3azFtMVplWVNTQ0o2Snh1WUEwdzlJQTZZak56ZHp3bHZ5STQ1T1A4?=
 =?utf-8?B?WGpaem0wWEN4Q1FSNkdBdExrdXB6MTFaZWFrREFSaWtBR1FheFJrUWwwWVQ3?=
 =?utf-8?B?ODNqcWdVZ1dCaUZBRHpYcEZHM0FsZTJkazlBZEJzeFAvbWVTSXlnWnd2VUd6?=
 =?utf-8?B?UXpoNmJTcVVRelE3UCticlFSNms1Y1BTdEtvanY2UGgzRFcxZk1YbHpxcCtk?=
 =?utf-8?B?NVNPTk1mV2lPZ0RoaTQzaTB5SDRiSDdXbU1aaWU2cDA2eS9kVGR0MkFGUXkv?=
 =?utf-8?B?eTJSL3JjZGVIVUtLVmtDdVRYN1VFc0t3eTRWS2txTVNibVJGbHZ1WWEzdmhL?=
 =?utf-8?B?cU5Jd2l1UFVWZEdGYko2MXB5T3ErMCtvUTVCMFNaRGhUWkxvejR2ZlRIL0RE?=
 =?utf-8?B?MXlzMXg2SGRhYzVFMVBiKzNiL0pMclowSmFuaHgwWEJHaHVUTnVQL3pzcXQv?=
 =?utf-8?B?bjE5N0ZraXBjaFQ4YWJKVjN4ZVJrOTN1NkJIN1ZSWkNuYTJ2TXhsZnorclhW?=
 =?utf-8?B?eEFMRXY1ZUl3OGl1RUNoSnZZejNoUVgyYVJIRnk0em0xKzd3czdlSUlsdmJS?=
 =?utf-8?B?S091RmNid3FTQWRhN2pkUVV5ZmdwR1JCZ0MvdWNMdlY3QTBSZmdHb0lUVVRz?=
 =?utf-8?B?WFNpWFlMb1JLNUR4N3dVa3Q5OEVUZjRRQVNMbDFjZjlSQzQ0dEFraFBNdTVo?=
 =?utf-8?B?N1Z2NUhGMS91blk3b2pGNjhvN0N6d2o3OXMvZEUyT05PVU1CcmVZS2EzcmpJ?=
 =?utf-8?B?dGIyNkpWV0gxYzdtMzhkUlREQytWMTdRWUpta0cwcHNIZWJBZjVsTmF4WGs1?=
 =?utf-8?B?cjJlM3VOLzUxN3BGUGdTOHN0MkJCdks1UlNuVGRvOVRzeGdPU3hpcXQwN2Zo?=
 =?utf-8?B?SDNhQnM0R09ZbW5XVllRUVJLRys1RnBkOEJRWkhJMFFrV1hjWWRJenBCWm90?=
 =?utf-8?B?Zy9VMHJYdk0yaDk2cjVmQXE3d1k2Z0lPWEJza0ZKMzI3dko5bTlIendib3pD?=
 =?utf-8?B?NFU1ekx3Y2ZWU2xnYS9vTmh1YUJXbXAxdDRpODlYamE3akczdHZLR3hwUmZn?=
 =?utf-8?B?d2lmRUlYOTRSYWlXeGJKd2xjQnJGcHZnUVhkY25lOGFsWWFWRGdqVTc4YmpW?=
 =?utf-8?B?RHNpMnRYK1VDWWhlY3ZIM0JGbmdtY2xwTi9waGZQcDVuekhyM2lIem5zTHl1?=
 =?utf-8?Q?7Lv6LNoFzo0f8=3D?=
X-Forefront-Antispam-Report:
	CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(186003)(16526019)(36756003)(70586007)(31696002)(41300700001)(966005)(8936002)(82740400003)(82960400001)(40460700003)(31686004)(70206006)(356005)(86362001)(8676002)(81166007)(53546011)(4326008)(40480700001)(2616005)(5660300002)(26005)(336012)(6916009)(36860700001)(54906003)(16576012)(478600001)(36906005)(2906002)(316002)(47076005)(82310400005)(426003)(83380400001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 11:53:39.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a95b64f-b760-4358-8a7a-08da760ff8c3
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TYZAPC01FT039.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5094

Hi Josh,

On 8/4/22 07:50, Josh Boyer wrote:
> On Wed, Aug 3, 2022 at 4:37 PM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>>
>>   amdgpu partially revert "amdgpu: update beige goby to release 22.20"
>> (2022-07-25 14:16:04 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
>>
>> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>>
>>   qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>>
>> ----------------------------------------------------------------
>> Mark Pearson (1):
>>       qcom: Add firmware for Lenovo ThinkPad X13s
>>
>>  WHENCE                             |   8 ++++++++
>>  qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>>  qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>>  qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>>  qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>>  qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>>  qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>>  qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>>  qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>>  9 files changed, 109 insertions(+)
>>  create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>>  create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>>  create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>>  create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>>  create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>>  create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>>  create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>>  create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
>> [banther@p1g4 linux-firmware]$ git log -1
>> commit 4ae4ae88918928e15006eb129ad981aa58216b59 (HEAD ->
>> lenovo-thinkpad-x13s)
>> Author: Mark Pearson <markpearson@lenovo.com>
>> Date:   Wed Aug 3 13:49:42 2022 -0400
>>
>>     qcom: Add firmware for Lenovo ThinkPad X13s
>>
>>     Add runtime loaded firmware for the audio, compute and sensor DSPs, as
>>     well as the zap shader for the GPU on the Lenovo ThinkPad X13s.
>>
>>     The files are placed under qcom/ as some distributions distribute
>>     linux-firmware as multiple packages and the qcom-specific package will
>>     be needed to provide some of the shared GPU files.
>>
>>     Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> Just so I make sure I understand, is the firmware provided by Qualcomm
> itself, or did Lenovo author it?  As of right now, it looks like
> Lenovo releasing Qualcomm firmware under the existing LICENSE.qcom,
> which is slightly odd.  Normally we'd like to see a Signed-off-by or
> Reviewed-by statement from the owner of the firmware if a partner
> company is releasing it to ensure it was intended to be released.
> 
> josh
The firmware is from Qualcomm but is done for Lenovo for the X13s.

My understanding is we (Lenovo) are the 'owner'. I have discussed
releasing this with Qualcomm and they are supporting us with this and
have approved me doing this release.

Does that help?
Thanks
Mark

