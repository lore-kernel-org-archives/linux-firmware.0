Return-Path: <SRS0=AVS2=6F=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55866C54FC9
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2020 07:46:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46D912087E; Tue, 21 Apr 2020 07:46:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81D62074B
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2020 07:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZILEXcDs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81D62074B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587455196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hqz7rkgqotVpHuhJ8CE4YEDThnfWyqKlAn4Gko9pj7s=;
	b=ZILEXcDs5hJPggu3O4JTMnzKIYimzYE4Zxxl2R14l/cLza6rcBZMN6dF3GyrPWUpnieu0J
	TmjBRIGs/vnofK8TzKQs0ljbpVVpn7FX/uDulKvYCpgtqk7mW5zF4xWDrlQ5zRP1nVV+lS
	55jhzofpYLQoxwtf9DiK4a+8OL+PpPQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-LHMFWQy1MqOgoTRFoHGW3g-1; Tue, 21 Apr 2020 03:46:34 -0400
X-MC-Unique: LHMFWQy1MqOgoTRFoHGW3g-1
Received: by mail-wr1-f72.google.com with SMTP id j16so7093374wrw.20
        for <linux-firmware@kernel.org>; Tue, 21 Apr 2020 00:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hqz7rkgqotVpHuhJ8CE4YEDThnfWyqKlAn4Gko9pj7s=;
        b=E953KTfA2lmqpVdOUf9Rz1j0G1SboSOCV1t6J/heePZwPdhiDpXsWhCffWKGI2oPZe
         +rAhnZvc1a+5B9xPToUiwONeF5o118wqJZ8s/wK0cl3a/aNMBVYGcttr8b7CDJ10Rmy9
         /8cEw04b/lP8Vz0qN2BObpqChDHI4Uq30SMGQBOXYa+LYe9QeTuBO6LkfTEZGnCBGlvP
         w0hsDVV0pp8lSKpzouVh8KH7LnbELLuGav1DUGL+b3HTgvnej/DGOkza+ibBL3g2bPVk
         o2NkjWS3d/bf623+qv3HnmVX/dGwsnJGbowtnWgEFkdOjU9TMO05vOVqBXU6sVPPSBgT
         e5ng==
X-Gm-Message-State: AGi0PuYcg7q8eQO2UshgtKVgwi1dNeObeoUULCY7hcN4/KCp6r6YGvSu
	1kgxWB+sLG2gjv52bzYdqpLshEGAyehh6TzxRC7WZbP2oTILP1Mx4JsnsV0jsCZq6FUlltIPDAk
	tMThUwAMcXTPyKO41HpKa
X-Received: by 2002:a7b:c190:: with SMTP id y16mr3732343wmi.50.1587455193402;
        Tue, 21 Apr 2020 00:46:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGr1J3IvGFJk7SwVW6qh/qNoc44VCKXFlllydoHILnEARLhskVWRRAmTRKjeW/zm6DEO7oBg==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr3732320wmi.50.1587455193140;
        Tue, 21 Apr 2020 00:46:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a125sm2406712wme.3.2020.04.21.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 00:46:32 -0700 (PDT)
Subject: Re: [PATCH] Add symlink for Dell XPS 15 9550 Broadcom Bluetooth
 patch-ram file
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
References: <20200417162022.428430-1-hdegoede@redhat.com>
 <CA+5PVA5dD7LWLfh4HaQnzZOLKi-eWJjX9qBJmEsKqRhJ2HD-UQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <df06edbf-003b-bb1c-ac8e-d46a3c5ed2da@redhat.com>
Date: Tue, 21 Apr 2020 09:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+5PVA5dD7LWLfh4HaQnzZOLKi-eWJjX9qBJmEsKqRhJ2HD-UQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 4/21/20 12:31 AM, Josh Boyer wrote:
> On Fri, Apr 17, 2020 at 12:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The linux-firmware repo does not contain many Broadcom (now Cypress)
>> Bluetooth patch-ram files, because we have never been able to get
>> permission to re-distribute those.
>>
>> We do have one file for the for HTC Vive, which was submitted by HTC
>> themselves with permission from Cypress.
>>
>> That file contain a "BCM20703A1 Generic USB 20Mhz fcbga_BU" patch-ram
>> build. The patch-ram files used by Windows for the Bluetooth module
>> in the XPS 15 9550, USB-id 0a5c:6410 is also a "BCM20703A1 Generic
>> USB 20Mhz fcbga_BU" patch-ram build. Since the build-parameters
>> (crystal MHz, package/module type used) between the 2 builds are an
>> exact match we can also use the HTC submitted patch-ram for the
>> XPS 15 9550. So lets add a symlink for this.
>>
>> This will make the Bluetooth on the XPS 15 9550 work out of the box,
>> when linux-firmware is installed, without the user needing to go and
>> find a suitable patch-ram file themselves.
>>
>> This has been tested on a XPS 15 9550 with both Bluetooth HID and
>> Bluetooth audio devices.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   WHENCE                 | 1 +
>>   brcm/BCM-0a5c-6410.hcd | 1 +
>>   2 files changed, 2 insertions(+)
>>   create mode 120000 brcm/BCM-0a5c-6410.hcd
> 
> It should be possible to do this by simply using the Link directive in
> the WHENCE file.  That will create the symlink at installation time.
> It's a fairly recent enhancement.  I'll look at it tomorrow and adjust
> if so.

Nice, that would indeed be an improvement as in the past make install
turned the symlinks into file copies IIRC.

Perhaps you can also convert the brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
symlink to use this new method?

Thank you for taking care of adjusting the patch.

Regards,

Hans

