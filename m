Return-Path: <SRS0=1lGz=3A=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DC3FA3741
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Oct 2022 18:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5D61C433D6; Mon, 31 Oct 2022 18:39:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2955C433C1
	for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 18:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2955C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id b2so20596456lfp.6
        for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QD9I/Io73NXhv6vuPQAZR34rbl9fAgyID+CM+BVilyc=;
        b=PRkvD8+7IGrRwcM9Ip5T4GblFOF6r6tyWWuKUS3ImEeadOL8xg+PbVwma0dejRyRbf
         6N758/uamhpU6ylDssgp53nleGS/mxXKVt+sFuhch3XDjv7q2jKUevC78RHQeH+0Jx4V
         c5AJKkDlFMoYDVU3HQSXp/t9q9Ij8JEBWc4ngwn4oeSH5jHGqml90AFxbCrelZMocpgK
         KvddzSlNFx+peRiwP1rLfuQOHjadWGwpdf3RaYjPFRPIJpoTIy6vYc2G//+rl9Nc4qg2
         0pPSU6AeaSw/qBqsnEQD6g4ay7a4sEdwo633tDWzKhWysqii9Hx9Xur+kkIW0goaMa7f
         E1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD9I/Io73NXhv6vuPQAZR34rbl9fAgyID+CM+BVilyc=;
        b=vHq7gHrKUUXdO8+/MGIcSEKKcNPpGvJyWhDxCBoOdbGTGj+8UfdhaE+y8KlGkQXHBe
         umwS3bW5F7VtuLKxjZ5rv6wu7f0qxxuaBYXMyKA71w7/dYdjEz6yu0NoMzu5QtaeIksi
         AM3ftu7B93qqm7gjQsi68eolcjU4AkFBgM602ZXcvVCVPsrnWaV/027y9MEbrd3Sfa7H
         N5JJxg7aMDDh4f/vegrUIXkZ6ymN+wabAMUz1/hw2HvP2t13wEaXDNBCyn/Jg9avNQ1A
         Vdz8/5CSGqc/l6Llpppk0DF1kbLTeYqvxs+85iHhxsbLx5/5t7VuMYOM3Wtzl7n7Z5af
         KvXw==
X-Gm-Message-State: ACrzQf2gv14RdpgjSGBCh7o7+uRDBmWxFpLKS/nqB9p+muLuQT5xtzw/
	OzWf4g/n6fQAQlCii6Bava0Ycyaz/l3D4A==
X-Google-Smtp-Source: AMsMyM65fqNU07UkemXao1tc2YoXEJiQEjyudhb9/27IgSRVRQgveOlVeBWO9nEII7wnswEaYRfBiw==
X-Received: by 2002:a05:6512:3c96:b0:4a4:7abe:10d9 with SMTP id h22-20020a0565123c9600b004a47abe10d9mr6541928lfv.350.1667241571373;
        Mon, 31 Oct 2022 11:39:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l15-20020ac24a8f000000b0048a934168c0sm1397698lfp.35.2022.10.31.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:39:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>
Subject: [PULL] qcom: drop split a530_zap file in favour of a530_zap.mbn
Date: Mon, 31 Oct 2022 21:39:30 +0300
Message-Id: <20221031183930.103623-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the example of recent qcom/venus changes. Drop the split
qcom/a530_zap.bNN files. Replace the qcom/a530_zap.mdt with the symlink to
qcom/apq8096/a530_zap.mbn.

The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware a530-mbn

for you to fetch changes up to 7d2bb50ced53767875f30f94cebdbd17b1346b9b:

  qcom: drop split a530_zap firmware file (2022-10-31 21:33:47 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: drop split a530_zap firmware file

 WHENCE            |   5 +----
 qcom/a530_zap.b00 | Bin 148 -> 0 bytes
 qcom/a530_zap.b01 | Bin 6536 -> 0 bytes
 qcom/a530_zap.b02 | Bin 4900 -> 0 bytes
 qcom/a530_zap.mdt | Bin 6684 -> 0 bytes
 5 files changed, 1 insertion(+), 4 deletions(-)
 delete mode 100644 qcom/a530_zap.b00
 delete mode 100644 qcom/a530_zap.b01
 delete mode 100644 qcom/a530_zap.b02
 delete mode 100644 qcom/a530_zap.mdt
