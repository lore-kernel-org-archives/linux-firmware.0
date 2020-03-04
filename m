Return-Path: <SRS0=QzYI=4V=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACD1C3F2D1
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Mar 2020 11:46:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C5A721739; Wed,  4 Mar 2020 11:46:03 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70A22146E
	for <linux-firmware@kernel.org>; Wed,  4 Mar 2020 11:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FKOJXMWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70A22146E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583322361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCc7BElPshbmHtWbpagJwHxtkWCPSA1SVypRulNi+oI=;
	b=FKOJXMWujAvERLLKRrmsTbWT56z/bgErDTEtVycy+R+jo9KQnnHoIu9CWqJDJlZ6JlYLAU
	d0fyM091ECUrBTfORSLtdU5qmAG/xsp1f1+QYFzv18G7T1VgmpN6CaY4FUVa0l/e9uJ2vZ
	zpx+D5+vhMbdr3u3avQMEWh7v0DiCfg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-KIbsNRsKOdi3eGCeiykutg-1; Wed, 04 Mar 2020 06:45:57 -0500
X-MC-Unique: KIbsNRsKOdi3eGCeiykutg-1
Received: by mail-wr1-f70.google.com with SMTP id b12so749813wro.4
        for <linux-firmware@kernel.org>; Wed, 04 Mar 2020 03:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cCc7BElPshbmHtWbpagJwHxtkWCPSA1SVypRulNi+oI=;
        b=RqByc1qVD43pyoK/nctbV9uI1Cjg7NNrXS2DJsHUlDYf/Ing3v8AQKHX6oRyOZcfAt
         KWpRHx6E8RACUF4iu38FZs+j3/n4w0v+cD3bOhNo1rBnjKPFBLy1uMIk+cBwcvygEW5a
         h8kAP8dQchUZRZCwovSWqfnRtn7MMnRP4GwzJwlF0T8oII0NzJnZm3CYUFvVeQ/wkCOn
         A+EwrskVIMXvIq3MRRvUg/cfDKRLfBoA9bCYAjW0wHJA9tMRmy3E2VjsEqba5lnx+5eL
         JlqcHbdeDMl0k3dhVeT37/nunWt807KNKF1yMWNXcRdvZyOeegska5HRwiD3j047RoiL
         xynA==
X-Gm-Message-State: ANhLgQ1GjvuWW/ogT1+hlNLZikiwpG6eiiCfNOUJ000jo8QlgBb2Ju8T
	/cMQ5r3SZyxS4MQTEti0cpB1gWndvrupRv6c1VHXMSnF7zUjjdUUXq9S2KauvdHyp9S6OufCltE
	Ue36flgC2B+ZuvdYBz7Lu
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr3265901wmd.69.1583322356248;
        Wed, 04 Mar 2020 03:45:56 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtDCFoIzfRfvbrwlxy97mJ/vLfuAr+c71xd1ne4wJN7KG9hlnGajvZ1LeDt6NFSBwXSN8nQog==
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr3265875wmd.69.1583322355946;
        Wed, 04 Mar 2020 03:45:55 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id z12sm11885882wrs.43.2020.03.04.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 03:45:55 -0800 (PST)
Subject: Re: Updating cypress/brcm firmware in linux-firmware for
 CVE-2019-15126
From: Hans de Goede <hdegoede@redhat.com>
To: Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Chirjeev Singh <Chirjeev.Singh@cypress.com>,
 Chung-Hsien Hsu <cnhu@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
Message-ID: <c2f75e84-6c8d-f4f0-bcc6-5fb2b662de33@redhat.com>
Date: Wed, 4 Mar 2020 12:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2/26/20 11:16 PM, Hans de Goede wrote:
> Hello Cypress people,
> 
> Can we please get updated firmware for
> brcm/brcmfmac4356-pcie.bin and brcm/brcmfmac4356-sdio.bin
> fixing CVE-2019-15126 as well as for any other affected
> models (the 4356 is explicitly named in the CVE description) ?
> 
> The current Cypress firmware files in linux-firmware are
> quite old, e.g. for brcm/brcmfmac4356-pcie.bin linux-firmware has:
> version 7.35.180.176 dated 2017-10-23, way before the CVE
> 
> Where as https://community.cypress.com/docs/DOC-19000 /
> cypress-fmac-v4.14.77-2020_0115.zip has:
> version 7.35.180.197 which presumably contains a fix (no changelog)

Ping?

The very old age of the firmware files in linux-firmware is really
UNACCEPTABLE and very irresponsible from a security POV. Please
fix this very soon.

If you do not reply to this email I see no choice but to switch
the firmwares in linux-firmware over to the ones from the SDK which
you do regularly update, e.g. those from:
https://community.cypress.com/docs/DOC-19000

Yes those are under an older, slightly different version of the Cypress
license, which is less then ideal, but that license is still acceptable
for linux-firmware (*) and since you are not providing any updates to
the special builds you have been doing for linux-firmware you are
really leaving us no option other then switching to the SDK version
of the firmwares.

Regards,

Hans

*) We have distributed files under the old version of the license before

