Return-Path: <SRS0=fOYR=QV=gmail.com=fujita.tomonori@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD63CF9C69
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 10:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 492CBC4CEC5; Mon, 23 Sep 2024 10:22:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 649B6C4CEC4
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 10:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 649B6C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7191fb54147so3062904b3a.2
        for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727086938; x=1727691738; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csL+2y8m1MjB8isGAIn2E7l3XjPggi3odnFYmrHUoqw=;
        b=Atib5fQ0I2kFR1b81kFhyUJlSKtpXJxdHEuVL/yP1rVBFqdPc8jpSG0rKLvfUQvhfM
         bXfmaGKluDqlsWGbk3pfGB9+ALnqrstvhh6FfgXNi2HwpY+oqfdoVBHbTChM8HF25qXP
         nIp7GJmtYcVrx8fqQS67W3s/ZSiUoHrMfCVWDTa3iWwlaqUOzKgza9GyAuLqneqTlgrG
         r3IYS9Lt+aVWIP+G9r4dc+uscKNcBQXmLcAnHWWbydyXf2/i0thRYtL9jPjvkk/UVXK1
         kqq63vxUAOTH+fQBLR/7f2QcVjwtCIk8fgVFfRc8yPzuSQfo1EqnlZ1PTB4S1JA+fi7x
         q5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086938; x=1727691738;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=csL+2y8m1MjB8isGAIn2E7l3XjPggi3odnFYmrHUoqw=;
        b=MTKtJcbt2gIoWPEQE0YTtLUYHeUOPz4J4CgNAo47EsTHL01o9fcCyWgnizmcO/n/rD
         ODSSszajdIUy24SuHETxyrEjtPT4Xu9KMFJr8vghyvbkaGB2O4+eGaDf0xONKYURcVNp
         l2MI9ldQaJaj3/dPQP1WtbfVLlz16u/JY/Jfq1vV7rgHwC2M919ue8tJufpdJ28P1WX2
         Wtcc7/cBKGuwyH6T0iaYjmuxw4l4WvptQzG5lRXAdzVFNdaa0mZpDBn0xbtTj+prbMvU
         55fyTmqHbfrUpz63mnv59UdWhJy5mX5Dnv4X56HChWgpgAzJXpuEjXI11YcjIXQ1OQ9F
         404w==
X-Forwarded-Encrypted: i=1; AJvYcCVrds82Sv4Tc+R9c/MPU6Svm79KFNunThhrbAkCktt1tZA7o2G5n4yfKs4x0r9wA9TwQ2PvMlPngv2XzOYOJg==@kernel.org
X-Gm-Message-State: AOJu0YwgtEro87bzwTzRI4KeccnHQFMoyhaVkpd+vXMsoF06WIZ8C9RB
	EBc0LaZSIf8O7WgoF4Q9gmUQZVUKqufg3ocWeW9X6h0U3uZE5IyE+Uq0Joza
X-Google-Smtp-Source: AGHT+IHWDPngmFbtoXEngJfOFJcurInGLdvBSlDniGzq2rNAlYPwa/EgdcoB6aSFCpfgGNKXNUtJEQ==
X-Received: by 2002:a05:6a00:4b0c:b0:717:8deb:c195 with SMTP id d2e1a72fcca58-7199ce0c432mr15874973b3a.21.1727086937579;
        Mon, 23 Sep 2024 03:22:17 -0700 (PDT)
Received: from localhost (p4468007-ipxg23001hodogaya.kanagawa.ocn.ne.jp. [153.204.200.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b5b2sm13583027b3a.139.2024.09.23.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 03:22:17 -0700 (PDT)
Date: Mon, 23 Sep 2024 10:22:14 +0000 (UTC)
Message-Id: <20240923.102214.413602747512610544.fujita.tomonori@gmail.com>
To: dmitry.baryshkov@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: fujita.tomonori@gmail.com, linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <tb5ykgcjrvowen2w7wklq46ypibmlzi4l3whdzxwrecelbzyw5@cw45aljcai24>
References: <dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
	<20240923.050651.1829650131953275090.fujita.tomonori@gmail.com>
	<tb5ykgcjrvowen2w7wklq46ypibmlzi4l3whdzxwrecelbzyw5@cw45aljcai24>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 23 Sep 2024 13:02:02 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, Sep 23, 2024 at 05:06:51AM GMT, FUJITA Tomonori wrote:
>> On Mon, 23 Sep 2024 06:40:10 +0300
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> 
>> >> >> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
>> >> >> >> +File: qt2025-2.0.3.3.fw
>> >> >> >> +Version: 2.0.3.3
>> >> >> >> +
>> >> >> >> +Licence: GPLv2.
>> >> >> >
>> >> >> > If it is GPLv2, where is the source code?
>> >> >>
>> >> >> For example, the driver is available at Edimax site:
>> >> > 
>> >> > Where is the source code for the firmware itself? (or quoting GPL v2
>> >> > "preferred form of the work for making modifications to it").
>> >> 
>> >> It's included in the distributed file. Someone extracted the file and
>> >> uploaeded. To save you the trouble, here are the links:
>> >> 
>> >> - the firmware
>> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.h
>> >> - the PHY driver
>> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.c
>> >> 
>> >> Am I understanding your question correctly?
>> > 
>> > Not quite. You are stating that the firmware is also covered by the
>> > GPLv2. As such we have to provide source code for the firmware blob. In
>> > other words, the "preferred form for making modifications" to the
>> > firmware file, not just the C source file containing the embedded
>> > binary.
>> 
>> Ah, understood. It's impossible to get source code for the firmware
>> blob. What's an appropriate licence for this case?
>> 
>> Redistributable or Unknown?
> 
> Well, either way it might be problematic for linux-firmware. Is the
> original vendor still alive?

No, the vendor went out of business.

> If so, you can ask them to license the firmware under some kind of
> redistribution-friendly licence (BSD, MIT, some custom text). It
> should allow redistribution in binary form with no restrictions or
> attachment to any kind of hardware. It can restrict _using_ the
> firmware for what vendors are used to call 'applicable hardware'.


