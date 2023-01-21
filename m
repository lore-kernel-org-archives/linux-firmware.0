Return-Path: <SRS0=PPve=5S=collabora.com=denys.f@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368E1C004D4
	for <linux-firmware@archiver.kernel.org>; Sat, 21 Jan 2023 06:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFFF6C433EF; Sat, 21 Jan 2023 06:24:04 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46CB8C433D2
	for <linux-firmware@kernel.org>; Sat, 21 Jan 2023 06:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46CB8C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FB8B6602CEE;
	Sat, 21 Jan 2023 06:23:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674282234;
	bh=e7WewTrgo9LC9rOdErvwfbPOOaHGf+xcs9UVAFkWhAE=;
	h=Subject:From:To:Cc:Date:From;
	b=T2xdabDSZPCjtK4qBGkoAY6wQubmmtAhAg1Wa42hsGiFWQpZEmA4KVXlfJlh2C7e6
	 VZCJtlkNgOmdTzXlHF+8Y/9qdxaogkPZIKjjPtOHk0MKFVYBapTlhMnnSwHGkzqrYt
	 wsCBIfhpoRmJXIOUhkOO3AIDOH5f7iBpjIBJ2eCwtZbzKjspWeCtiW60bkgeZpp7Hn
	 4k8rg4Q2T3jVd4b2SKoB3Ege5b7/qiglX3zgLzsNHPxQUeExLsqkVWK2QP8z3hrLEB
	 8q8RSF1AGF4AOInP0wz3cD+na3XJsadfEaXzfCJyCeHwSWZ8spuK9EMcitr2yTzqJ6
	 omc5c/LDudDTg==
Message-ID: <5dc7081a8b793baf08f20df6b641a86a80c9e15c.camel@collabora.com>
Subject: pull request: add back missing symlink to Qualcomm firmware file
From: Denys Fedoryshchenko <denys.f@collabora.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Nathan Hebert <nhebert@chromium.org>
Date: Sat, 21 Jan 2023 08:23:49 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add missing symlink required for Qualcomm SC7180.
As stated in
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom/venus-5.4?id=ad9fdba01fd2c909ea7962844211e25aa276e705
likely by mistake file got deleted, instead of replaced by symlink.

It results SC7180 failing to load firmware with following message:

1679 20:43:46.474154  <4>[   18.381820] qcom-venus aa00000.video-codec:
Direct firmware load for qcom/venus-5.4/venus.mdt failed with error -2

After fixing it device booting without error.


The following changes since commit
7e4f0eda76d58024f78ac68d4ffd6f87d63a3a29:

  Merge https://github.com/pkshih/linux-firmware (2023-01-17 08:00:15 -
0500)

are available in the Git repository at:

  https://github.com/nuclearcat/linux-firmware 

for you to fetch changes up to
a02f1168becbaacbae82a7002ff489c137f9b8b4:

  qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn (2023-01-20
14:18:17 +0200)

----------------------------------------------------------------
Denys Fedoryshchenko (1):
      qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn

 qcom/venus-5.4/venus.mdt | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 qcom/venus-5.4/venus.mdt


Thank you!

