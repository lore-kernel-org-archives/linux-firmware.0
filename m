Return-Path: <SRS0=+IOy=GO=arm.com=jeremy.linton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAF2C433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Jan 2021 02:00:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B2F6225AB; Mon, 11 Jan 2021 02:00:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id DD9402253A;
	Mon, 11 Jan 2021 02:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9402253A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jeremy.linton@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3F5731B;
	Sun, 10 Jan 2021 18:00:03 -0800 (PST)
Received: from [192.168.122.166] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B46E03F66E;
	Sun, 10 Jan 2021 18:00:03 -0800 (PST)
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
To: Peter Robinson <pbrobinson@gmail.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20210108204916.1724298-1-jeremy.linton@arm.com>
 <CALeDE9M4YZc9Wga5DvUebr4bgM8z3E-Aa7V-WoKxy01GfkaCSw@mail.gmail.com>
 <CA+5PVA5uogMz53S+gaBGVC5E=miJjDoa+sbRjmubcFXPueOzGQ@mail.gmail.com>
 <CALeDE9P+KLXx4qhJs520K+AYkWwOgNEGgMEo2XnZgcLnr=hMuQ@mail.gmail.com>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <2b85361a-ce9e-27bc-5a2d-d6e8e9660e7a@arm.com>
Date: Sun, 10 Jan 2021 19:59:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CALeDE9P+KLXx4qhJs520K+AYkWwOgNEGgMEo2XnZgcLnr=hMuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 1/9/21 7:09 AM, Peter Robinson wrote:
> On Sat, Jan 9, 2021 at 12:34 PM Josh Boyer <jwboyer@kernel.org> wrote:
>>
>> On Fri, Jan 8, 2021 at 6:35 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>>>
>>> On Fri, Jan 8, 2021 at 8:49 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>>>
>>>> The rpi4 when booted with a full featured
>>>> firmware reports a machine id from SMBIOS/DMI.
>>>> Since that is used to select the firmware we
>>>> need to add a new symlink.
>>>
>>> Overall the patch is fine but the commit message is very opinionated
>>> for a wifi firmware support patch. For one it's not a newer DMI string
>>> for Raspberry Pi as all current strings are for device tree and in the
>>> context of supporting WiFi the difference between what ever the
>>> firmware you're referring to when you say "full featured firmware" is
>>> irrelevant and marketing, does that "full featured firmware" support
>>> more features of the wifi chipset than the other variants of firmware?
>>>
>>> Except for the commit message:
>>> Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
>>
>> Not sure what I'm going to do with that.  Do you have a better commit
>> message you'd like to suggest, or are your objections not strong
>> enough to warrant a rewrite?
> 
> How about:
> brcm: Add link for Raspberry Pi 4 for matching DMI string
> 
> When the Raspberry Pi 4 is booted using a ACPI firmware
> the wireless driver matches against a DMI string so
> add a link to ensure the wireless works with that firmware
> variant as well.
> 

I will come up with something and re-post it tomorrow, although I think 
Peter needs to read it with a more euphemistic tone... :)



