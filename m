Return-Path: <SRS0=MiXK=U6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB8C0219D
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Feb 2025 22:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9C1AC4CED1; Fri,  7 Feb 2025 22:36:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 998BDC4CEE2
	for <linux-firmware@kernel.org>; Fri,  7 Feb 2025 22:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 998BDC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54505191cdcso38867e87.2
        for <linux-firmware@kernel.org>; Fri, 07 Feb 2025 14:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738967788; x=1739572588; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCBRtbtvquU0QQ/GURB3ZUTiwKxDwgq/jZWhBrO1o+Y=;
        b=saM36WSiCL+Nnn5Q2LSRNkfA6T+cuux7f3RfXtftt0sCx0AQUmi4iq8Lx0KrZps02N
         0OuuRYMGgKyAvXyPSNFJMjhXP7Zy8Cg8E+hjxNNXteIv5XwPbNp8Acs0zL4v61THAY5D
         H+nw47R5l6+IqZRjue57eRZr4vFWj8ePm73r4bTuic5x5PMIp5CjPlCip9zFR5z5ZifH
         1UsynyNtXwBZMI/hN/MepdonUX0gzMWCb3o4i5SjMZyyocQnylUseTv3vOfb+iDqF/yt
         vvwNHa9BvZ3hLqC4YZkNWFXHs2OOZ2hgJCg/mHjeauB/6fgsWeHmbmFHk65eY/52MhUN
         3mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738967788; x=1739572588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCBRtbtvquU0QQ/GURB3ZUTiwKxDwgq/jZWhBrO1o+Y=;
        b=nzdIsYrxGTW3+QLLizpkE94EIeKKtoZ6Fwk+AJOeXbWtWt/lEd1MOwK2Ne6bISJwXG
         iONgNF91OyskeTYy6kmhPMXrKK5smBy6eGG4ad5q+ORh9oH9lYryvW34kH5rKPdhZqzF
         v9q0g16IitF4qkR9zusdd2Q+7PDM2ylWU0W45kN2q+YFtOvGbaUHkm/6I7SXfakz53C0
         yJZMQXbQdkqqurk9iOyiOCElFcQ5W8J5XhF/2JpQkXpSKtGAdFfQyMFYYEUBz15tvKUI
         7w04qaThVbbksf0nyrEM9oQXjYTVmgenEsMLjFwYHeQGaTn94DX2j+N5X9RAJAh8+RUI
         izdw==
X-Gm-Message-State: AOJu0YwkKPiwuVSrlfSiLFZ4/cjnS2H67ODeZsXmNR19H8Qd5RdSMhOl
	29AcTB1253uo71lEcZ+USo1t6h1rDUrfyLekrhlk9/YIGAOUG1LFQFC8miNpJgLqqAm9/pTjWfU
	loEc=
X-Gm-Gg: ASbGncu7xKcjOJKcGVqU4IiJkzO1fydh49L7Lh3A6lUaFXWmFatgPm0WIU6JfVlNn9Y
	Wrp/nhrwHxL0zOc336YPqyMaMIRa87LA74uTvtgBjpfn+haJswxQsZAy8ax0EiWcEhsjP+LLD9a
	mWyOy4mg3nPtsI3pHhz6T7+f144DI6wuz2eqMq3ePxiQ1kTlVyaveUDpMx3HV6x2d0GJ4aZCFbW
	o/K4D1k9y3aheXfknchu8egf9cGaZvykyicGHJKXj4VGsbI4ExZslnIqPUF8+/MWJv2zdLXwt6e
	kAOpQdo9aTG5CCBAl/2vWbwQ0/UAcrKb1FSqutJiKNy+VWChuWK4+b2z
X-Google-Smtp-Source: AGHT+IHJKulsWrOQhK/kTqZTd3JuUz5Q9DcvxMWxd+w0/jhflV22IDRgeexH7zMEd1B61+Y7uxarvQ==
X-Received: by 2002:a05:6512:39cd:b0:544:132e:155d with SMTP id 2adb3069b0e04-54414ae06dcmr1891948e87.39.1738967788339;
        Fri, 07 Feb 2025 14:36:28 -0800 (PST)
Received: from rohan.lan (82-128-213-148.bb.dnainternet.fi. [82.128.213.148])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bf660sm571205e87.125.2025.02.07.14.36.25
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:36:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] WHENCE: split generic QCA section into USB and serial sections
Date: Sat,  8 Feb 2025 00:36:25 +0200
Message-ID: <20250207223625.49891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to help distributions to package a proper set of QCA firmware,
split the single QCA61x4 section into two: one for serial-attached chips
and another one for the USB-attached chips.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/WHENCE b/WHENCE
index 16441127bf0e..a8df012d4b4c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4721,26 +4721,16 @@ Licence: GPLv2 or later. See GPL-2 and GPL-3 for details.
 
 --------------------------------------------------------------------------
 
-Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 chips
+Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 USB chips
 
 File: qca/nvm_usb_00000201.bin
 File: qca/nvm_usb_00000200.bin
 File: qca/nvm_usb_00000300.bin
 File: qca/nvm_usb_00000302.bin
-File: qca/nvm_00130300.bin
-File: qca/nvm_00130302.bin
-File: qca/nvm_00230302.bin
 File: qca/rampatch_usb_00000200.bin
 File: qca/rampatch_usb_00000201.bin
 File: qca/rampatch_usb_00000300.bin
 File: qca/rampatch_usb_00000302.bin
-File: qca/rampatch_00130300.bin
-File: qca/rampatch_00130302.bin
-File: qca/rampatch_00230302.bin
-File: qca/nvm_00440302.bin
-File: qca/rampatch_00440302.bin
-File: qca/nvm_00440302_eu.bin
-File: qca/nvm_00440302_i2s_eu.bin
 File: qca/nvm_usb_00000302_eu.bin
 File: qca/rampatch_usb_00130200.bin
 File: qca/nvm_usb_00130200.bin
@@ -4768,6 +4758,23 @@ Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt
 
 --------------------------------------------------------------------------
 
+Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 serial chips
+
+File: qca/rampatch_00130300.bin
+File: qca/rampatch_00130302.bin
+File: qca/rampatch_00230302.bin
+File: qca/nvm_00130300.bin
+File: qca/nvm_00130302.bin
+File: qca/nvm_00230302.bin
+File: qca/rampatch_00440302.bin
+File: qca/nvm_00440302.bin
+File: qca/nvm_00440302_eu.bin
+File: qca/nvm_00440302_i2s_eu.bin
+
+Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+
+--------------------------------------------------------------------------
+
 Driver: qca - Qualcomm Atheros Bluetooth support for WCN3950 chips
 
 File: qca/cmbtfw12.tlv
-- 
2.47.2

