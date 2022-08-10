Return-Path: <SRS0=i6NH=YO=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B31C00140
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Aug 2022 15:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5D45C433C1; Wed, 10 Aug 2022 15:20:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D298AC433D7
	for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D298AC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660144820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O6vaKfwX5BtNaW4ME4gTngY51WDdUaFrdA3J72i/G8o=;
	b=LV2p9kXh72FFJUWo97eQ/pqWAlnzwd/xrkGyCNdH1HzXTAiHz3pyzRFv6fWvpFzpAzFJcx
	xPNuRkgQyrdKiduk0RvnCwM/OlPEiLu1AP++T4IsgPb7BD8WpELgvH28R0nJCNVVihHGmx
	ZRKICSW/1BhfIZyrvnHZPolmjIkZzRk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-dBfcrMt-OfC2ilvRerfZ9Q-1; Wed, 10 Aug 2022 11:20:19 -0400
X-MC-Unique: dBfcrMt-OfC2ilvRerfZ9Q-1
Received: by mail-ej1-f71.google.com with SMTP id nc38-20020a1709071c2600b007309af9e482so4336567ejc.2
        for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 08:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=O6vaKfwX5BtNaW4ME4gTngY51WDdUaFrdA3J72i/G8o=;
        b=jqFIbpTUJM7GhhTDGJZwytELPS7AAiksGREdbEIZ/8GvI4JBHaj/Cybjv/cW78acqe
         UGljDvhSEd8Iu5dSS3EHxYvjGGUwtKOtYb++W5x9rXbCPfX6WADcHDeMaQaXQ9kQLTx/
         RzxfR081EskmRa5lssLEve5pBBnrYAs3Pg4c5Qbf7X04/n4/FMVSzp5epU90RQcD2eHx
         kadMbaMkhZ0LDyRRdw1NNPAdtvwBvCa5MnkjWarMUjXOO/otJtyQNNp5vv83DVr7vk35
         9zYw5+I7txBKnhDXE78QMv/2X6loNrzXVWpN9UkMLo3oZ41pXxItw9+uOzTzxjQMJmTO
         P8Eg==
X-Gm-Message-State: ACgBeo2IGjLobW2YkXeJ078hZsrk/flrKdZ+3Yj2E+HKK17U2A7NqVFB
	5qxP/JuhqmumlstKna7KrVo95r7jI5w6XW+FjzS2RxfE98oCXwICOH/pnoyifdH+7tZFDFUlmoh
	Ijk0AhcxCimNZ1FyPEJIH
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id hq2-20020a1709073f0200b006f35c42321amr20653457ejc.521.1660144818054;
        Wed, 10 Aug 2022 08:20:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5V8x6yQdv22eQSXRIPDQjxN+PI9HRgHJbMmcChPIYWw6kzH2nmZ/3u0ra73xeVsq/rz6AXNg==
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id hq2-20020a1709073f0200b006f35c42321amr20653446ejc.521.1660144817831;
        Wed, 10 Aug 2022 08:20:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b007304bdf18cfsm2424001ejb.136.2022.08.10.08.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 08:20:17 -0700 (PDT)
Message-ID: <084b6f6f-a21f-14ac-4e09-1da8cd074e08@redhat.com>
Date: Wed, 10 Aug 2022 17:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: [linux-firmware GIT PULL] Add 3 new brcmfmac nvram files
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Josh,

Here is a linux-firmware pull-req to add 3 new brcmfmac nvram files,
to make Wifi work OOTB for users on the boards needing these files.

Regards,

Hans


The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:

  Merge branch 'main' of https://github.com/suraj714/BT-Upstream (2022-08-10 07:58:34 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git brcmfmac-nvram-updates

for you to fetch changes up to c58f00165b28f2ec094cafbff14b18196e1bec35:

  brcm: Add nvram for Lenovo Yoga Tablet 2 830F/L and 1050F/L tablets (2022-08-10 16:27:41 +0200)

----------------------------------------------------------------
Hans de Goede (3):
      brcm: Add nvram for the Asus TF103C tablet
      brcm: Add nvram for the Xiaomi Mi Pad 2 tablet
      brcm: Add nvram for Lenovo Yoga Tablet 2 830F/L and 1050F/L tablets

 WHENCE                                             |   3 +
 ...1b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt | 149 +++++++++++++++++++++
 ...mac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt | 103 ++++++++++++++
 brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt       | 137 +++++++++++++++++++
 4 files changed, 392 insertions(+)
 create mode 100644 brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt
 create mode 100644 brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt
 create mode 100644 brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt

