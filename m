Return-Path: <SRS0=KNjV=63=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795B7C7EE30
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Mar 2023 20:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49013C433A0; Fri,  3 Mar 2023 20:56:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86964C4339E
	for <linux-firmware@kernel.org>; Fri,  3 Mar 2023 20:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86964C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677876994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JJEskpeuAFSoZFhhZ6uf7W72XBP3JtS4xj6835KOqRk=;
	b=YGZCWtei2Ah5js74kM8S0wbvbsefO6OOFK+LuuddV+H+QcVgeLUM/GDczeBUMz4SXO44BX
	6DWC0qriD4rStE6/GjxIvU/xdTruvcXxParkQA1KUlZKgcGaAyk29CKLVuOgVKHk1CCVC3
	agb0I333y3KXelQTt/4Qbdlb4Zc2zFk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-T6lkRGcdOG-J051s3JzeaQ-1; Fri, 03 Mar 2023 15:56:30 -0500
X-MC-Unique: T6lkRGcdOG-J051s3JzeaQ-1
Received: by mail-ed1-f72.google.com with SMTP id v11-20020a056402348b00b004ce34232666so2480736edc.3
        for <linux-firmware@kernel.org>; Fri, 03 Mar 2023 12:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677876989;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJEskpeuAFSoZFhhZ6uf7W72XBP3JtS4xj6835KOqRk=;
        b=X/CvefntfWuuONgRvQah9XgLFwhacV1eScpDCpxhr9YPgDe0h6iVsmI4sxtpqPzV27
         F8NKXC8li4QRUpEcaUwx+Bu4cpE+RR4t/eEZ18aMbNv5775tdXDhTraXJoieRYpeXHde
         ZesNJ0Uud7NBQuE8Nf7VpmcaR9ABwYpGAp86dYbv3s95VgzUEkZRMT7ucwFpBQryJs6j
         4HjH7SlAqBcTSA60kBNFZcnzH1Ln0urNxHEpTpX36FUQt9WmFtoZvmILX4ZIEFFHW04k
         9rKWsRSnnhvaqQ7ZEbwo5MSRiymLAqyWMopK6WfaQUhAgpwK+sgilVavDcPdXaIegzXa
         cwpQ==
X-Gm-Message-State: AO0yUKUpFP5UqgwkVJT9juuog46jgqrFFsYfGU4Eir1YrX+kkQBrShYt
	NVNa0yMB6k0iaBOxRnH/+90sMjFHd02ZrcR0pakzjMk6nFDDKVYqEDQFRf2a5LELtbpOuhWuGF3
	qu+TMq90zvkh5MgY2+1lE
X-Received: by 2002:a17:907:8e9a:b0:86a:833d:e7d8 with SMTP id tx26-20020a1709078e9a00b0086a833de7d8mr3233640ejc.17.1677876989041;
        Fri, 03 Mar 2023 12:56:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+uyJoIgo+kycKICc6eS2RyH8UPAFQPkyYgjDwXR+zY81EQkPDAgtRMi3+yiF+BNHrUDN68iQ==
X-Received: by 2002:a17:907:8e9a:b0:86a:833d:e7d8 with SMTP id tx26-20020a1709078e9a00b0086a833de7d8mr3233620ejc.17.1677876988775;
        Fri, 03 Mar 2023 12:56:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906504200b008f767c69421sm1336255ejk.44.2023.03.03.12.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 12:56:28 -0800 (PST)
Message-ID: <758660d0-0cc7-18b4-5f88-c8f341fe2d50@redhat.com>
Date: Fri, 3 Mar 2023 21:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Hans de Goede <hdegoede@redhat.com>
Subject: [linux-firmware GIT PULL] brcmfmac nvram file updates
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Josh,

Here is a linux-firmware pull-req with 1 brcmfmac nvram file fix +
2 new brcmfmac nvram files to make Wifi work OOTB for users on
the boards needing these files.

Regards,

Hans


The following changes since commit 60971a6485ee604c47cc905ff77c583ae001f9df:

  Merge branch 'liquidio-20230222' of https://github.com/dchickles/linux-firmware (2023-02-27 12:33:07 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git brcmfmac-nvram-updates-3-3-2023

for you to fetch changes up to 76ad2755a29fcace1a948b4413313dfac3aff284:

  brcm: Add nvram for the Lenovo Yoga Book X90F / X90L convertible (2023-03-03 21:45:12 +0100)

----------------------------------------------------------------
Hans de Goede (3):
      brcm: Add nvram for the Advantech MICA-071 tablet
      brcm: Fix Xiaomi Inc Mipad2 nvram/.txt file macaddr
      brcm: Add nvram for the Lenovo Yoga Book X90F / X90L convertible

 WHENCE                                             |   2 +
 brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt   | 147 +++++++++++++++++++++
 ...ie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt | 139 +++++++++++++++++++
 brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt       |   2 +-
 4 files changed, 289 insertions(+), 1 deletion(-)
 create mode 100644 brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt
 create mode 100644 brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt

