Return-Path: <SRS0=FTFS=TD=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB2DC433EF
	for <linux-firmware@archiver.kernel.org>; Sun, 20 Feb 2022 00:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83D78C340F0; Sun, 20 Feb 2022 00:03:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8E01C004E1
	for <linux-firmware@kernel.org>; Sun, 20 Feb 2022 00:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8E01C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id p9so23719675ejd.6
        for <linux-firmware@kernel.org>; Sat, 19 Feb 2022 16:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnaIQdB+iXedf3GN8OGR1xIuGwJL0u/NOAK2KVJCRus=;
        b=KkyFMSs/lEg7jxRV1WBpKcKnU7stVsFjVatSvcmNi/5SEFWtTfrUIIDIAmR+nfWpON
         +yFuHsejn4vMJAvrlo95RKC7OaK2o7R8rax7zdHGgD63PPCKrIeI1rvtnBzp6OMgnRuJ
         o/v4lC0GO3ELHU740/qR2k4ZO8mYR8PMgq9MCFLUlHb/oA1adq5XPCGPIGiOrNtje2XV
         xUx6mPz1ftsfp57YaPtUaoc+kbu9N1ARlnQugOCHBrOQHxMTlaghAOutkKpXjLh4FCml
         4toeOuTWFA84IZqLdwq6aCC6UsKv1rkUUXgld/Ayb9nXFi5ulDKXgOTBuox809U+13AV
         xq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AnaIQdB+iXedf3GN8OGR1xIuGwJL0u/NOAK2KVJCRus=;
        b=G1T3A58OO2r8KV+T0UiNbLlWImmkvicKXV1CzzdganoQWTP2h8EtCMfP1m6BIDPFpC
         2F51khvNIX0qd5YgjiRyNWvJE/FFszDx3fXBQdATOVj33k5ORfJAxYHhK3gwNhpz6NFi
         2zw2CrJQIL6y04IJYNodkwqmW0wG6pnP2R2RmgpWOMGS/38PzRO9IWEolKYgs7k5vIQS
         bpo8Byd3TrzgiZcwqHXIfCpTreWj6IvFGkcCqb+neu+GJ326hpzWHHn7jGuKVOZMfWST
         HwFw3BR9+tXVHbVxqEUzMtMtfaoZXFPmUqSn2IWX65tM/SM0Ix/tZyqHB8vl4/IlX4WC
         0Amg==
X-Gm-Message-State: AOAM533pMadxq7EJG1Ooi3KRfbwx/YheQZByCQsSueCJnKIqn5o9kA1p
	GdVOA7nKrBhRxRbdKineFW4G/wV6RSI=
X-Google-Smtp-Source: ABdhPJzrVO6dPL5q535qMjkvN4cx4FY3+k1AyVdCC1SpCEcgG/xANttdptfB9cTP1JIxqUDtG2Tqzg==
X-Received: by 2002:a17:906:2bd7:b0:6ce:698b:7531 with SMTP id n23-20020a1709062bd700b006ce698b7531mr10778992ejg.146.1645315437001;
        Sat, 19 Feb 2022 16:03:57 -0800 (PST)
Received: from debian64.daheim (pd9e29b3d.dip0.t-ipconnect.de. [217.226.155.61])
        by smtp.gmail.com with ESMTPSA id go13sm3619177ejc.190.2022.02.19.16.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 16:03:56 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nLZhi-00417G-Og;
	Sun, 20 Feb 2022 01:03:54 +0100
From: Christian Lamparter <chunkeey@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH v1 5/5] ath10k: QCA6174 hw3.0: update board-2.bin
Date: Sun, 20 Feb 2022 01:03:54 +0100
Message-Id: <f01a8dfd623c688ac40a6e7164a6a69bc5762ca8.1645315230.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <95987bff707e1219429a2702bd0c5a2939966ed7.1645315230.git.chunkeey@gmail.com>
References: <542cdfe3a91a19cba63c98cb742e63d4b58240d9.1645315229.git.chunkeey@gmail.com> <d09e1f4b89f3f516f7edaa235c5034a88d2f7c76.1645315230.git.chunkeey@gmail.com> <8a3f58542ba05d1bae02789822cd315e868b2b0c.1645315230.git.chunkeey@gmail.com> <95987bff707e1219429a2702bd0c5a2939966ed7.1645315230.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
<https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0>

556321a QCA6174 hw3.0: update board-2.bin
d1a9282 QCA6174 hw3.0: sync board-2.bin from upstream linux-firmware
c987e38 QCA6174 hw3.0: update board-2.bin
b44d86f QCA6174 hw3.0: update board-2.bin
8ba5ed7 QCA6174 hw3.0: update board-2.bin
3ce0d6d QCA6174 hw3.0: update board-2.bin

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 ath10k/QCA6174/hw3.0/board-2.bin | Bin 715444 -> 723668 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath10k/QCA6174/hw3.0/board-2.bin b/ath10k/QCA6174/hw3.0/board-2.bin
index 0bc5ddabc3354269822edd75fb7ab329c0efd6a8..239db8985d7aecbb6662db917319512fdffdc876 100644
GIT binary patch
delta 47
zcmdmTRr|_RorV_17N!>F7M2#)7Pc1l7LFFqEnHh(O)k)6nZDp9M<|nt`F8z7j7Q}G
DvL_Lq

delta 29
lcmcaIRcFgp?S>Y{7N!>F7M2#)7Pc1l7LFFqEnHh(0RXGF3ikj2

-- 
2.35.1

