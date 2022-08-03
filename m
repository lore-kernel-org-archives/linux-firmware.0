Return-Path: <SRS0=M6Ji=YH=lenovo.com=markpearson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D257CC19F2B
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Aug 2022 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8897C433C1; Wed,  3 Aug 2022 20:37:47 +0000 (UTC)
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF0DCC433D6
	for <linux-firmware@kernel.org>; Wed,  3 Aug 2022 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF0DCC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lenovo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
	s=Selector; t=1659559065; i=@lenovo.com;
	bh=zTuH0fQHh5NVbvkAezpNXUY12ybXy4/ZsgMVwxXumKY=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=SKzT13q9rn+3qBvEvBg6xkL5+14zEdJb8hwlP6sNduLPkfoqD9TNqZx8k/vOhEBX6
	 y9xjQ6pGbNrAhDtS0d3DsouoqkJ/Um7mjK5mZ2vDe0YBl850fllwvhmAuXC+Z7uIaS
	 8C7tHzwjntzNykQhv9NPeIGOY29oXPi0JehILsH7GVxcB8SPhz2goDqnXKHit4oZjZ
	 NMuaDNdcLNlF82d6gLLEISafg+GvXLAHu9EM//+5F78nUh6D6YOjO0fiHRSA1nbDv3
	 FBj3RyvpqkQ24zGooNm3xPfd+Iz9oLO8EGR8Ui2BeBfE2AeNPXTTX2/8KKqbabIanr
	 vT1iaZMB4iGJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRWlGSWpSXmKPExsWSoZ9nqDvjzqs
  kg6mH9C1O73/HYnFguY0Dk8emVZ1sHneu7WELYIpizcxLyq9IYM14O+MOa8EuwYoXn/YwNTAe
  4+ti5OJgFFjKLDFlwiV2CGcRq8SPhdOZIJxOJoktV6aDZYQE5jJJfF5zkQnCOcQk8fDCHEYQR
  0LgOKNE96F1UJlORokfr06xQDj9TBK7flyGch4zShx/dpINwnnIKPHs5DTmLkZODl4BW4mGab
  /BbBYBFYn/b1eyQsQFJU7OfMICYosKREg8fDQJzGYWEJe49WQ+E4gtIiAvcWJ+B9CJHEBxBYn
  nP2NBwmwC2hJbtvxiA7GFBUwkjnUeZ4Zo1ZRo3f6bHcKWl9j+dg5YXEhAWeJX/3kwWwJozKpf
  3xkh7ASJ5ilHoWxJiWs3L7BD2LISR8/OYYGwfSUu3vwH1asr8WXlRTYIW07iVO85JghbXmLnx
  ttQ9TISE/dcYIGE3QV2iaY1L9gmMGrNQvLyLCRvzkJy9ywkdy9gZFnFaJ1UlJmeUZKbmJmja2
  hgoGtoaKJrZgakLPUSq3QT9UqLdVMTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQITUEqRU/k
  OxqaVP/UOMUpyMCmJ8laeepUkxJeUn1KZkVicEV9UmpNafIhRhoNDSYK38BZQTrAoNT21Ii0z
  B5gMYdISHDxKIrzTbgKleYsLEnOLM9MhUqcY7TmubNu7l5njwYmTQPLqlStA8tr6BfuYhVjy8
  vNSpcR534JMFQBpyyjNgxsKS96XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzqoIs58nMK4
  Hb/QroLCags3S4XoCcVZKIkJJqYGJd6t88/fUp3S75VQHWe9n+VXawZGxMDZodd4rv62FvVU3
  +bU82zNF5284cYnNb9pyR79W5U3rT96v03VvN/neOh5Chi0WZ9SF3ld5dUxfsmyPEXlpi7HOw
  s2PNsVlr1B5yc9a/nljW/FzI8kPe6XVJChz86+QrUsT5Fkh9fKYhPnlvmEXHrF8KC1qOWHG0h
  4W53F/QKXaP43KK29bLR+bfOP4/eRqvZqc9n03Y4phNs3zr5KRfL9Fu68t8smvTDa3504SZ1x
  8snFu46lDBd/ub8vUaTlJ/o06tnOazVfn7/tDj8ffV2uujt65LenFZevrTL/X3HjLeT1jT8Ek
  nriG06Dhr4Ovfi26tyzzxdYcSS3FGoqEWc1FxIgC6x8OyWQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-715.messagelabs.com!1659559063!18840!1
X-Originating-IP: [104.47.110.49]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8725 invoked from network); 3 Aug 2022 20:37:44 -0000
Received: from mail-tyzapc01lp2049.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.49)
  by server-18.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2022 20:37:44 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaV5FHm/ri1x1xPc3bvBTw3qaB0CBZFfSVtqoo5D8vdRXKwcDPLsBPKfBUL0vtdtFhuuBijDcdEdCJk5ff+maUczYEpzRZEd7zUWMBCyr+X911BtEmpWIdKkbKhJfagMX+4PFzo3EoeAh8Cr/8Z2imFhY1NMyJcLkkbxG0JHgsx3LW0XbMKV+kZJAv1xDChB9zFk1ENYSc4AzUIdPATA3FR0aXFmdjCnpkef7X5ktLHdocu6UvCCwDDY51Rb4VGh6h1GAEAwp3z5Wqz9LIoGMGooKyQlCakuqKYd1TYCGRe2PT6JBkBdBvoIa3vu1GIIeEtmBoqZSBoQusbAPsGf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTuH0fQHh5NVbvkAezpNXUY12ybXy4/ZsgMVwxXumKY=;
 b=Su7YheWwELsLX3jjlEbMbDjsfTX2auG327W2dw/29sGkWEKTPlxagZEcQOUXsxY8sd8yTA5bOIV5WaxJHlE87dvgM1wZQgSI1EKAyuK+1XE344Q7LNb5SoTcMRVmRPHzjS3UMCR/RLEF0PKN3TQJ2t/nNl6iHsOtZPIjIbuNBG66tWdw1UMZRYTvJ5HcMRHD+MKH+mu9srH3G/20gDDBkbAPEywm5OAi8vlkeLnt9oD7/aKwaVJlaaDQDOAYTAaf5R+UgqCClebs7TvC8fozR9HpOB6r/8zIcK/ACPR7uSeHIUK51VA/N8BHuzQw14qVaLQz7uPvrCE/QcsIQcgXIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PU1PR06CA0001.apcprd06.prod.outlook.com (2603:1096:803:2a::13)
 by HK0PR03MB3299.apcprd03.prod.outlook.com (2603:1096:203:57::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.10; Wed, 3 Aug
 2022 20:37:41 +0000
Received: from PSAAPC01FT067.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:2a:cafe::ee) by PU1PR06CA0001.outlook.office365.com
 (2603:1096:803:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 20:37:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT067.mail.protection.outlook.com (10.13.38.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Wed, 3 Aug 2022 20:37:39 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Wed, 3 Aug
 2022 16:37:37 -0400
Received: from [10.46.215.48] (10.46.215.48) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Wed, 3 Aug
 2022 16:37:37 -0400
Message-ID: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
Date: Wed, 3 Aug 2022 16:37:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <bjorn.andersson@linaro.org>
From: Mark Pearson <markpearson@lenovo.com>
Subject: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.215.48]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76bb516-c57f-4299-9065-08da75900238
X-MS-TrafficTypeDiagnostic: HK0PR03MB3299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2UaN2fF1+MswjaIWkAZIn+HqbOI2ZPgSa2KVokbm7FmQthzyCDg0QDMFM4BWEjfwfahRyloz6esLOnUXV4QylGhDJdvMlAUPj3U+3BfjwtPQPKRk6Qix4MvIT+1Qikqr6dnFivEyXudDuL5wIDis03HrJQsHr1iN4jN0Z/1R1AKkqhg2y54sriuNreKOtAfSWpPJ7M2vlHLWz/AQA42l5WhK4yfy44n34fQ2gOz84gQpJB5Poeg0rsrJPEuwPpDtJ9w+tFojQPQTZMl0AF0/zESz6Ue7NtGjppc36aO1sdId1m7KEDrkpqSQbSrL6vJga26aNFhGX31sqONyu/enxnPocNS3uEGpCLqkZ0W8dSMKlA7IvYZbXcG4LVVVjI5/tm8KunztVBoPciUuKKWclqsTye8F5QAA36XfSP0FCk9mhKPw2ZIoGbuAMwdyarMezR+Muep5zhOSWhqVrax2kre9gniRzqgkGHkkJQA31uMQFutaRMBo4MP8k7G+TFpzV+N0w13wsFBCaOpLxFqWl9banZaFp2oIzVQ8XnXFapGE2LK4BkGeDI4FTZU5XmMkBjQNoYzkOZt7rGqhn3Zd8CaGQMEJ+AKdRo9ogFBzPEY+D1l3UAMrZDiKqjRHJCeDKxQ/MKZBf3NcvlulCj45AtbL52QzYe/d1F3TKzKibkDJSthDV46C6A4h8kpkxQc18DIQVktiFpUFTNvSFnbnzElmBWsuWfxabiKMwWqgCh0y3hiNpmjH96/6rmE7In/nLEyd9FHlrRaLOLRXUDSsf852wEejpYevJy5bQzig7+jY72oxRbGUNumJxnXPJu6Va0MWUVaMXNMHAchS33I2pVsO7BzSvRgJ/AWhQlQ1y4OW8YxgyywFqqfRZsoTKrt8dDk0KNEykqfuWjxrKOPIR8F9VrWkQF1EugQR/WLXpdg=
X-Forefront-Antispam-Report:
	CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(40470700004)(46966006)(2906002)(16576012)(8936002)(316002)(6916009)(2616005)(31696002)(4326008)(8676002)(81166007)(86362001)(426003)(5660300002)(356005)(36860700001)(336012)(70586007)(70206006)(47076005)(82960400001)(40460700003)(16526019)(83380400001)(186003)(41300700001)(478600001)(26005)(31686004)(82310400005)(36756003)(966005)(40480700001)(82740400003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 20:37:39.4973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76bb516-c57f-4299-9065-08da75900238
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PSAAPC01FT067.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3299

The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:

  amdgpu partially revert "amdgpu: update beige goby to release 22.20"
(2022-07-25 14:16:04 -0400)

are available in the Git repository at:

  https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s

for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:

  qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)

----------------------------------------------------------------
Mark Pearson (1):
      qcom: Add firmware for Lenovo ThinkPad X13s

 WHENCE                             |   8 ++++++++
 qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
 qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
 qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
 qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
 qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
 qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
 qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
 9 files changed, 109 insertions(+)
 create mode 100644 qcom/LENOVO/21BX/adspr.jsn
 create mode 100644 qcom/LENOVO/21BX/adspua.jsn
 create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
 create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
 create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
 create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
 create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
 create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
[banther@p1g4 linux-firmware]$ git log -1
commit 4ae4ae88918928e15006eb129ad981aa58216b59 (HEAD ->
lenovo-thinkpad-x13s)
Author: Mark Pearson <markpearson@lenovo.com>
Date:   Wed Aug 3 13:49:42 2022 -0400

    qcom: Add firmware for Lenovo ThinkPad X13s

    Add runtime loaded firmware for the audio, compute and sensor DSPs, as
    well as the zap shader for the GPU on the Lenovo ThinkPad X13s.

    The files are placed under qcom/ as some distributions distribute
    linux-firmware as multiple packages and the qcom-specific package will
    be needed to provide some of the shared GPU files.

    Signed-off-by: Mark Pearson <markpearson@lenovo.com>

