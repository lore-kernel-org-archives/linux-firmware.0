Return-Path: <SRS0=6E6G=EW=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0849DCCF9F0
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 00:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFB13C433C8; Wed,  6 Sep 2023 00:02:19 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF7A4C433C9
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 00:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF7A4C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso4245393a12.2
        for <linux-firmware@kernel.org>; Tue, 05 Sep 2023 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693958535; x=1694563335; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is2n8guo2Uwi3PELiICF0O4hEvBWi3NTMahMKutEeG8=;
        b=XNG10Z903q+No+Ikaed6X/XYrGcBAZg8eJ4A5oMbUSu39xpENjZSxLKyyRNScmMa5v
         UqOhSUPn9CkTbDKvilxYMk8rMt+AMxkg4Wj0h+5t3CKIvkNSIon6j2LDrBGwydnzyBDM
         TWq/bWQG6KmbcZGWSo08Reaoqz5UeyShWJz3XKymc6KtrXJabJo2o/mwN9Be8n3t/NQa
         T7ZRMiy5yIfGG58GYVVByEgwc/V2fh+TTVWjXBs7CPjj01dUQspVz/mSR3W+zmPcCpmk
         ufwoHmZIK5krAHpiHaC+fZ33KA6iumEnvCGb8OlGowjLYFx63Kbt60K5g7E/RHVt0zZB
         kSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693958535; x=1694563335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is2n8guo2Uwi3PELiICF0O4hEvBWi3NTMahMKutEeG8=;
        b=R0VMGVyxJfRkmglXmvwbUw2sj5C69UtjSxwSGvehAEwifwk0mhtJaEupvRUWRe4CGE
         UJv2gE6yfyzGZpCU4MTxwiWFRCgGwOyPtk+iMRs88sbRuE8tugsOLujf68zo89hJeYYj
         EvRhza975Xjtrn/FOmUZU4tOIJY0L75R//yiGA8FI+ujnBqei0zgKFEQ2lz9xzxRrokx
         edgv17T1P+UfQykMwRz4xIIvZi5S8Wn16AyHwtZR1wMp4dJhQ0UgTJmS6Sso2RZH6KJw
         mRpq0wllz/Aa/OtUuqGIF766SceLKi9bSroq/AwEKpohIAWj+t5FSUMGV40stSRnt5Aq
         oYkg==
X-Gm-Message-State: AOJu0YxTM1rVGJEDQ0xo+x0HsCLsU8x5ow0RsK/JSs6CiVHh31Qt71d9
	xSMo82pU8sRefpgzKvAlKH0WO89aldYMQKOVnjc=
X-Google-Smtp-Source: AGHT+IEjqSmuVIOY2bs3zNmK2bo0d6wgPXsvVOkNEphpsGvuQgk2FWY39wOz9LuZQ6foyTIaxfTWmA==
X-Received: by 2002:a50:fb0f:0:b0:522:3d36:ff27 with SMTP id d15-20020a50fb0f000000b005223d36ff27mr992930edq.31.1693958535361;
        Tue, 05 Sep 2023 17:02:15 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p11-20020a056402074b00b005231e1780aasm7609318edy.91.2023.09.05.17.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:02:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
Date: Wed,  6 Sep 2023 03:02:13 +0300
Message-Id: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please pull in firmware files for new Thundercomm boards, Qualcomm Robotics RB1
and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, video
en/decoder (venus) and Adreno GPU firmware files.

The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8ddb5:

  Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2023-08-04 06:33:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb12-fw-v2

for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632be:

  qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-08-23 20:24:47 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (5):
      qcom: add GPU firmware for QCM2290 / QRB2210
      qcom: add firmware for QCM2290 platforms
      qcom: add firmware for QRB4210 platforms
      qcom: add venus firmware files for v6.0
      qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210

 WHENCE                    |  27 +++++++++++++++++++++++++++
 qcom/a702_sqe.fw          | Bin 0 -> 20388 bytes
 qcom/qcm2290/a702_zap.mbn | Bin 0 -> 13804 bytes
 qcom/qcm2290/adsp.mbn     | Bin 0 -> 12826756 bytes
 qcom/qcm2290/adspr.jsn    |  21 +++++++++++++++++++++
 qcom/qcm2290/adsps.jsn    |  21 +++++++++++++++++++++
 qcom/qcm2290/adspua.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qcm2290/modem.mbn    | Bin 0 -> 8881672 bytes
 qcom/qcm2290/modemr.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qcm2290/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
 qcom/qcm2290/wlanmdsp.mbn | Bin 0 -> 3828228 bytes
 qcom/qrb4210/a610_zap.mbn | Bin 0 -> 14384 bytes
 qcom/qrb4210/adsp.mbn     | Bin 0 -> 13196348 bytes
 qcom/qrb4210/adspr.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/adsps.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/adspua.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qrb4210/cdsp.mbn     | Bin 0 -> 3003924 bytes
 qcom/qrb4210/cdspr.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/modem.mbn    | Bin 0 -> 8881672 bytes
 qcom/qrb4210/modemr.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qrb4210/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
 qcom/venus-6.0/venus.mbn  | Bin 0 -> 1794076 bytes
 22 files changed, 306 insertions(+)
 create mode 100644 qcom/a702_sqe.fw
 create mode 100644 qcom/qcm2290/a702_zap.mbn
 create mode 100644 qcom/qcm2290/adsp.mbn
 create mode 100644 qcom/qcm2290/adspr.jsn
 create mode 100644 qcom/qcm2290/adsps.jsn
 create mode 100644 qcom/qcm2290/adspua.jsn
 create mode 100644 qcom/qcm2290/modem.mbn
 create mode 100644 qcom/qcm2290/modemr.jsn
 create mode 100644 qcom/qcm2290/modemuw.jsn
 create mode 100644 qcom/qcm2290/wlanmdsp.mbn
 create mode 100644 qcom/qrb4210/a610_zap.mbn
 create mode 100644 qcom/qrb4210/adsp.mbn
 create mode 100644 qcom/qrb4210/adspr.jsn
 create mode 100644 qcom/qrb4210/adsps.jsn
 create mode 100644 qcom/qrb4210/adspua.jsn
 create mode 100644 qcom/qrb4210/cdsp.mbn
 create mode 100644 qcom/qrb4210/cdspr.jsn
 create mode 100644 qcom/qrb4210/modem.mbn
 create mode 100644 qcom/qrb4210/modemr.jsn
 create mode 100644 qcom/qrb4210/modemuw.jsn
 create mode 100644 qcom/venus-6.0/venus.mbn
