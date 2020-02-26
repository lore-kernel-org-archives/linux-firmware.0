Return-Path: <SRS0=eY9s=4O=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C615C4BA24
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Feb 2020 22:16:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 081A721D7E; Wed, 26 Feb 2020 22:16:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7682072D
	for <linux-firmware@kernel.org>; Wed, 26 Feb 2020 22:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UF7GZ0n1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7682072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582755402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=adv2gMDHdJrSNT8UFFETSumaGBAQt4WCebanQKid9IU=;
	b=UF7GZ0n1Xz9E8U1XFr5pg5NJ85mz7zOf5kvFcVwVDNbjJSa17Yn91xuac4VLHYUE+g8zWp
	zHynoIvNUMOFrpviNgNEhAFmDheH6MuddT2TFJHNyw/KwLORBuGqeYwN9+/UK5++JD5mbF
	ewB4vYHZlOAs0sckW6JuCvOIx5gP9pk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-5R5MZpQmOZKYtdAal7TNVw-1; Wed, 26 Feb 2020 17:16:35 -0500
X-MC-Unique: 5R5MZpQmOZKYtdAal7TNVw-1
Received: by mail-wr1-f72.google.com with SMTP id w18so396113wro.2
        for <linux-firmware@kernel.org>; Wed, 26 Feb 2020 14:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=adv2gMDHdJrSNT8UFFETSumaGBAQt4WCebanQKid9IU=;
        b=e/EaARag0nxYtD1O8F5kd0qRg1BWvU4Ym0AJkOxnwjyqTAbL1HqJHcXQSqvufvC991
         PithhavRqjq/J5x1KaWdpKeB0bsfnzOxaVLkb4bxDdD83oedLxg3suuMp6Y0IZ83JhsA
         PGtag0MZD+jJfoLz2B0gaj0hZYsDhDc+7SPOC1BNK3xtm10idmyO8hIe3fHTDXyy+ufv
         25psqeWmjCIX0PoFhISFRF6HxDNvk3TjWKm2x+PCLrZJ5Bq3gZUH/TxPwNidpPuEeQCY
         QkJr3KYMdZUH5IJ+R00qCXvTOUtFc7Dw6kdju6R4baKoldNDJAxVQnW9XjHdUwtt10y5
         8m8A==
X-Gm-Message-State: APjAAAXfROAdXe2wsmlGTYTu5kat2yvc3Z/N7BP9oQKVpNSzmrMI4ahm
	6tMcUpdM150tZeF9yvrJsw7K21aFcsNjnrAWezTljV8/f3FGvCXHoP6fnsZxjNg1kAUCncd0vv4
	i3PcCzz+Zso22CG7GQEWx
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr987167wme.134.1582755394158;
        Wed, 26 Feb 2020 14:16:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmsicT3h4tLxMLXoSzTW55n/I22wHMyHI3oCwdmxH72apFzjH20mlpy8BOATYE62y6EP1+Dw==
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr987142wme.134.1582755393863;
        Wed, 26 Feb 2020 14:16:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id b10sm4974284wrw.61.2020.02.26.14.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:16:32 -0800 (PST)
From: Hans de Goede <hdegoede@redhat.com>
Subject: Updating cypress/brcm firmware in linux-firmware for CVE-2019-15126
To: Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Chirjeev Singh <Chirjeev.Singh@cypress.com>,
 Chung-Hsien Hsu <cnhu@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
Date: Wed, 26 Feb 2020 23:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Cypress people,

Can we please get updated firmware for
brcm/brcmfmac4356-pcie.bin and brcm/brcmfmac4356-sdio.bin
fixing CVE-2019-15126 as well as for any other affected
models (the 4356 is explicitly named in the CVE description) ?

The current Cypress firmware files in linux-firmware are
quite old, e.g. for brcm/brcmfmac4356-pcie.bin linux-firmware has:
version 7.35.180.176 dated 2017-10-23, way before the CVE

Where as https://community.cypress.com/docs/DOC-19000 /
cypress-fmac-v4.14.77-2020_0115.zip has:
version 7.35.180.197 which presumably contains a fix (no changelog)

Regards,

Hans

