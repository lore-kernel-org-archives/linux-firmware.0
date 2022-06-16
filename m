Return-Path: <SRS0=jZ7a=WX=quicinc.com=quic_zijuhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA4C43334
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jun 2022 09:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25FADC3411B; Thu, 16 Jun 2022 09:53:27 +0000 (UTC)
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 634B8C34114
	for <linux-firmware@kernel.org>; Thu, 16 Jun 2022 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 634B8C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655373206; x=1686909206;
  h=message-id:date:mime-version:to:from:subject:cc:
   content-transfer-encoding;
  bh=umv+Eq4jTlK3WuIDfYY8qycsIjvTwTEBXQuicyF8Uno=;
  b=mCiHMWzDxSnQfaE1NdxnkwRlLGkwEW/fXVYHtiVzYpteDUxkzLcM0FUL
   1FG7fW0BH3A375q6K6kMtMOw5auUfiC/p0cqIcLBfeHPvlYL94jdex+3W
   WVjE8QnxPJMsPp3gqnXkOskgap1gcx95lPPhvlQOtBn2rj+h29fgZNSNu
   4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Jun 2022 02:53:25 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 02:53:25 -0700
Received: from [10.253.13.118] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 02:53:24 -0700
Message-ID: <247174fd-8275-20c5-be09-221381b29afe@quicinc.com>
Date: Thu, 16 Jun 2022 17:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
Subject: QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00409
CC: <michaelfsun@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit
7b71b75be8fb0fa7cceeb3dc22f97920a6be28bd:

   Merge tag 'iwlwifi-fw-2022-06-09' of http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (Fri Jun 10 07:18:35 2022 -0400)

are available in the Git repository at:

   https://github.com/zijun-hu/qca-btfw

for you to fetch changes up to 47def1cbb1f8d81462d442d672bccb4e14db0c48:
----------------------------------------------------------------
Zijun Hu (1):
        QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00409 (Thu Jun 16 17:16:23 2022 +0800)
