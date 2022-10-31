Return-Path: <SRS0=1lGz=3A=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEDFECAAA1
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Oct 2022 18:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7F90C433C1; Mon, 31 Oct 2022 18:43:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF179C433D7
	for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 18:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF179C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id r12so20642362lfp.1
        for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXzIYz5+51v/Ox4rpeSDkU9wciu2UFoLCRABkqXo8ZY=;
        b=HmL9kRt83IsfClTFfER0OV+4Fvp6Ab6WsiA1rqp9SYZKs5krbcm0ylOIZ0Aic5PKTK
         n/yrr0VB5zMtpZ3A6doQoFlEJukOtcFPxqFxmkysWKRDSboYGf0AlsOxN5Bf1umFoh7J
         k4UnCLvUB075mPEuT1bEXqw0Cngph3g79Pzsgq/1IVN1rvO+t+UAqYcTwYc64TosRCgj
         pjVSK2cR47unZZzbriiRQfp4wgl4W/b6Innx23Y22nLKH7enEm9pAiFTjHZu0pRwtIE0
         8TvwE2txRXgAp6/tC07U1qs/GCD048qcW8cdN+0Z5/pmLZgKSV+KmliatIF+GwgEzGeO
         f4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXzIYz5+51v/Ox4rpeSDkU9wciu2UFoLCRABkqXo8ZY=;
        b=wYB5r5epCWtVD3Uiptf/pQfgn+gUPr85uaBhEkG1RZC4/xIU0u/jImT77CVwGE8e3b
         8CwOoK4WrT5wa/xdBJjaDga6oIf+PbG7Kz/icFkPwpXZgnI/50CTY8XHTKCJ57SkxQsd
         SSCJ42LLyfvi0r1wE7K2qr5NwjZUX/Ba+LNnnxEDLxz0B/Ux76ZDepKfG4ipmheCoqd4
         Wyis0GmGYJonkGBSCdWUfm/dU7xGSbnGcdhu86+Qo0GQMb+9d7jJztqogdmOCDo4UjRG
         DDdfezKMHSd4GPLsJLIxOsYDlEPpaPJB68a1r1m/CtBr8XgWJM6Znq/2Ex45Q/nhLFn3
         zAPg==
X-Gm-Message-State: ACrzQf3rPLRQgUMZ7XpSSItZ3czYGUQB2OpgH+k2WdJ8We82sX1MOnqi
	FXt8MPlGAI18ZsOZnTQLhkDvLYNR9bSWLQ==
X-Google-Smtp-Source: AMsMyM4T073Yv+JGLQqhkADELIid00CulstnKHkA4MtnuwYSQKVjQVdgipjDUmQ4sFXmnk1ToKNesg==
X-Received: by 2002:ac2:50da:0:b0:4a2:44dc:b820 with SMTP id h26-20020ac250da000000b004a244dcb820mr6323789lfm.316.1667241784612;
        Mon, 31 Oct 2022 11:43:04 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f07000000b0048ad4c718f3sm1393880lfq.30.2022.10.31.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:43:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PULL] qcom: replace the rest of Venus firmware with MBN files
Date: Mon, 31 Oct 2022 21:43:03 +0300
Message-Id: <20221031184303.113448-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the example of vpu-2.0 and venus-5.4 and drop the split venus.mdt/.bNN
files in favour of venus.mbn files. Provide compatibility venus.mdt ->
venus.mbn symlinks.

The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware venus

for you to fetch changes up to 7d5671369d1c8f2d4125ff931602f2f8fe20211a:

  qcom/vpu-1.0: drop split firmware in favour of the mbn file (2022-10-31 21:32:05 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      qcom/venus-1.8: replace split firmware with the mbn file
      qcom/venus-4.2: replace split firmware with the mbn file
      qcom/venus-4.2: drop split firmware in favour of the mbn file
      qcom/vpu-1.0: drop split firmware in favour of the mbn file

 WHENCE                                  |  37 ++++++--------------------------
 qcom/venus-1.8/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-1.8/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-1.8/venus.b03                | Bin 5568 -> 0 bytes
 qcom/venus-1.8/venus.b04                |   1 -
 qcom/venus-1.8/{venus.b02 => venus.mbn} | Bin 975088 -> 992976 bytes
 qcom/venus-1.8/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/venus-4.2/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-4.2/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-4.2/venus.b03                | Bin 28976 -> 0 bytes
 qcom/venus-4.2/venus.b04                |   1 -
 qcom/venus-4.2/{venus.b02 => venus.mbn} | Bin 884136 -> 925432 bytes
 qcom/venus-4.2/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/venus-5.2/venus.b00                | Bin 212 -> 0 bytes
 qcom/venus-5.2/venus.b01                | Bin 6600 -> 0 bytes
 qcom/venus-5.2/venus.b02                | Bin 837304 -> 0 bytes
 qcom/venus-5.2/venus.b03                | Bin 33640 -> 0 bytes
 qcom/venus-5.2/venus.b04                |   1 -
 qcom/venus-5.2/venus.mdt                | Bin 6812 -> 0 bytes
 qcom/vpu-1.0/venus.b00                  | Bin 692 -> 0 bytes
 qcom/vpu-1.0/venus.b01                  | Bin 7528 -> 0 bytes
 qcom/vpu-1.0/venus.b02                  | Bin 300 -> 0 bytes
 qcom/vpu-1.0/venus.b03                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b04                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b05                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b06                  | Bin 20 -> 0 bytes
 qcom/vpu-1.0/venus.b07                  | Bin 24 -> 0 bytes
 qcom/vpu-1.0/venus.b08                  | Bin 16 -> 0 bytes
 qcom/vpu-1.0/venus.b09                  | Bin 883152 -> 0 bytes
 qcom/vpu-1.0/venus.b10                  | Bin 41360 -> 0 bytes
 qcom/vpu-1.0/venus.b19                  |   1 -
 qcom/vpu-1.0/venus.mdt                  | Bin 8220 -> 0 bytes
 32 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 qcom/venus-1.8/venus.b00
 delete mode 100644 qcom/venus-1.8/venus.b01
 delete mode 100644 qcom/venus-1.8/venus.b03
 delete mode 100644 qcom/venus-1.8/venus.b04
 rename qcom/venus-1.8/{venus.b02 => venus.mbn} (98%)
 delete mode 100644 qcom/venus-1.8/venus.mdt
 delete mode 100644 qcom/venus-4.2/venus.b00
 delete mode 100644 qcom/venus-4.2/venus.b01
 delete mode 100644 qcom/venus-4.2/venus.b03
 delete mode 100644 qcom/venus-4.2/venus.b04
 rename qcom/venus-4.2/{venus.b02 => venus.mbn} (95%)
 delete mode 100644 qcom/venus-4.2/venus.mdt
 delete mode 100644 qcom/venus-5.2/venus.b00
 delete mode 100644 qcom/venus-5.2/venus.b01
 delete mode 100644 qcom/venus-5.2/venus.b02
 delete mode 100644 qcom/venus-5.2/venus.b03
 delete mode 100644 qcom/venus-5.2/venus.b04
 delete mode 100644 qcom/venus-5.2/venus.mdt
 delete mode 100644 qcom/vpu-1.0/venus.b00
 delete mode 100644 qcom/vpu-1.0/venus.b01
 delete mode 100644 qcom/vpu-1.0/venus.b02
 delete mode 100644 qcom/vpu-1.0/venus.b03
 delete mode 100644 qcom/vpu-1.0/venus.b04
 delete mode 100644 qcom/vpu-1.0/venus.b05
 delete mode 100644 qcom/vpu-1.0/venus.b06
 delete mode 100644 qcom/vpu-1.0/venus.b07
 delete mode 100644 qcom/vpu-1.0/venus.b08
 delete mode 100644 qcom/vpu-1.0/venus.b09
 delete mode 100644 qcom/vpu-1.0/venus.b10
 delete mode 100644 qcom/vpu-1.0/venus.b19
 delete mode 100644 qcom/vpu-1.0/venus.mdt
