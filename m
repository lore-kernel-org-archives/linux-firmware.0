Return-Path: <SRS0=o7Aq=4W=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D142C3F2D1
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2020 06:24:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B5B3208C3; Thu,  5 Mar 2020 06:24:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD120207FD
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2020 06:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWdkEMMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD120207FD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583389491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onavTSj9a/P9cQTzAh/dyBQ46vlcFHueFUhjebvWmRQ=;
	b=aWdkEMMhEDBGMDKsL74iXqhXbmLnKR7IoxtQJ1KOZTyMum/0aKxm4IauRzXzrjr0pxP+kG
	mJ89rbQJcijimucAvUXLDODU+tEJ9YfQz/13C/q/NmGu2/8fGho/OCJqiiIj7tzbcQr9fl
	tiN93UYZygKbWbIP/E9gJ0Rc1fKfq6c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-nWhHh0sAPCu_zK3X9KtStg-1; Thu, 05 Mar 2020 01:24:47 -0500
X-MC-Unique: nWhHh0sAPCu_zK3X9KtStg-1
Received: by mail-wr1-f72.google.com with SMTP id d7so1915969wrr.0
        for <linux-firmware@kernel.org>; Wed, 04 Mar 2020 22:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=onavTSj9a/P9cQTzAh/dyBQ46vlcFHueFUhjebvWmRQ=;
        b=sVpSCFLGnIhYyQz3MxErksxdx4TJoWFXgop85zA3COVYkhdTedgg2RqnXENjOozM46
         yOcCL6i98EyxpRH6UIUWvpD5Br19WoNbeA8WLrUqgVcPGS5dGcBvVZCH4YpW3nWfDFhQ
         9JI2c2t6cyL8dSYDcAPduFVheRYYr6K7086Tr5kGtKyBbDJMOGDaThq2Dd3OZElpLZJC
         9367JS4X8NYawxyVcSmc5tQYibJVENR1UyqxP5tSSng0feKIdqLgti84+y95Tz4iH9eP
         nrG5rBhrLpj4VA4Ltg8Rc10mWfqreRIhVXqgJlHaoipAjOXTGfdeQupBnbSRw3CpKKnT
         r/pw==
X-Gm-Message-State: ANhLgQ03+TkWwUxY2lxk5XQ896jYCT6M118V4aRvDlP13qbro0meSvHm
	qb1arqtVBddMYARAER4LXJP71Nx59TjwIKYMneTOO+oOYZkMS5nwG+je1058sYtew7CExc+bT66
	2Vtm49ffBs07C6Eu1SoiK
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr7582619wmc.103.1583389485991;
        Wed, 04 Mar 2020 22:24:45 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtiUZKoooY6I7KXJDNcIm/991GyLdsN4IX/2ZjkrqnVzZ2zAJhkHlmZQlxsSawC3GpXdxNnsg==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr7582593wmc.103.1583389485734;
        Wed, 04 Mar 2020 22:24:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-7a91-34f6-66f7-d87c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7a91:34f6:66f7:d87c])
        by smtp.gmail.com with ESMTPSA id p10sm39285099wrx.81.2020.03.04.22.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 22:24:44 -0800 (PST)
Subject: Re: Updating cypress/brcm firmware in linux-firmware for
 CVE-2019-15126
To: chi-hsien.lin@cypress.com,
 Christopher Rumpf <Christopher.Rumpf@cypress.com>,
 Chung-Hsien Hsu <cnhu@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
 <c2f75e84-6c8d-f4f0-bcc6-5fb2b662de33@redhat.com>
 <3cf961a6-56c8-81fb-3bf9-fc36e2601d2c@cypress.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <17ec344e-80c5-02a9-59a3-35789a2eaaf9@redhat.com>
Date: Thu, 5 Mar 2020 07:24:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3cf961a6-56c8-81fb-3bf9-fc36e2601d2c@cypress.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/5/20 4:50 AM, Chi-Hsien Lin wrote:
> (+Chris)
> 
> On 03/04/2020 7:45, Hans de Goede wrote:
>> Hi,
>>
>> On 2/26/20 11:16 PM, Hans de Goede wrote:
>>> Hello Cypress people,
>>>
>>> Can we please get updated firmware for
>>> brcm/brcmfmac4356-pcie.bin and brcm/brcmfmac4356-sdio.bin
>>> fixing CVE-2019-15126 as well as for any other affected
>>> models (the 4356 is explicitly named in the CVE description) ?
>>>
>>> The current Cypress firmware files in linux-firmware are
>>> quite old, e.g. for brcm/brcmfmac4356-pcie.bin linux-firmware has:
>>> version 7.35.180.176 dated 2017-10-23, way before the CVE
>>>
>>> Where as https://community.cypress.com/docs/DOC-19000 /
>>> cypress-fmac-v4.14.77-2020_0115.zip has:
>>> version 7.35.180.197 which presumably contains a fix (no changelog)
>>
>> Ping?
>>
>> The very old age of the firmware files in linux-firmware is really
>> UNACCEPTABLE and very irresponsible from a security POV. Please
>> fix this very soon.
>>
>> If you do not reply to this email I see no choice but to switch
>> the firmwares in linux-firmware over to the ones from the SDK which
>> you do regularly update, e.g. those from:
>> https://community.cypress.com/docs/DOC-19000
>>
>> Yes those are under an older, slightly different version of the Cypress
>> license, which is less then ideal, but that license is still acceptable
>> for linux-firmware (*) and since you are not providing any updates to
>> the special builds you have been doing for linux-firmware you are
>> really leaving us no option other then switching to the SDK version
>> of the firmwares.
> 
> Hans,
> 
> As we discussed previously, those files are not suitable for linux-firmware for the reason of regulatory (blobs are only for Cypress reference boards and could violate regulatory on other boards);

But the special builds you are doing for Linux firmware have a clm_blob
too, the only difference is that it is embedded. If it is possible to
embed a generic version of the clm_blob, then why not provide separate
a generic version of the separate clm_blob files, so that those can be
used together with build which you release regularly as part of your
SDK ?

This way you do not need to do special builds for linux-firmware,
which seems to be the main bottleneck for having up2date Cypress
firmware files inside linux-firmware.

> also clm_blob download is not supported in kernels prior to 4.15 so those files won't work with older kernels.

That is a valid concern, I'm not sure what the rules for linux-firmware
are with regards to this. OTOH those are quite old kernels and if we
must choice between having recent firmware for modern kernels or old
kernel compatibility I guess the preference would be to have recent
firmware. Likely devices using such old kernels are not updating their
version of linux-firmware anyways.

> Chris owns the Cypress firmware upstream strategy and will explain our going-forward strategy to you.

Ok.

Regards,

Hans

