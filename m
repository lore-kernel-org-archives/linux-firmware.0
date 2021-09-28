Return-Path: <SRS0=7/5G=OS=gk2.net=gandalf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73119C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Sep 2021 11:26:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 54FD361159; Tue, 28 Sep 2021 11:26:17 +0000 (UTC)
Received: from 3.mo5.mail-out.ovh.net (3.mo5.mail-out.ovh.net [46.105.40.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1790361131
	for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 11:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1790361131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gk2.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gk2.net
Received: from player699.ha.ovh.net (unknown [10.108.16.177])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 164412D3C34
	for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 13:26:14 +0200 (CEST)
Received: from gk2.net (unknown [37.170.183.88])
	(Authenticated sender: gerald@gk2.net)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id D3C7B229A1034;
	Tue, 28 Sep 2021 11:26:01 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-100R003cb590aa0-8fc2-4133-940b-2c69e53847b7,
                    8B447295A3246458203B232FECD739CE5D91E33E) smtp.auth=gerald@gk2.net
X-OVh-ClientIp:37.170.183.88
Subject: Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 Rakesh Parmar <rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>,
 Zhiyuan Yang <zhiyuan.yang@nxp.com>, prashanthkrishnan.ranganathan@nxp.com,
 Ganapathi Bhat <ganapathi017@gmail.com>, zheng.cao@nxp.com,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Josh Boyer <jwboyer@kernel.org>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
From: =?UTF-8?Q?G=c3=a9rald_Kerma?= <gandalf@gk2.net>
Message-ID: <1a47cb59-24e2-3393-b028-ad820d7dad9a@gk2.net>
Date: Tue, 28 Sep 2021 13:26:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
X-Ovh-Tracer-Id: 18146410277556312895
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepiforrhgrlhgupgfmvghrmhgruceoghgrnhgurghlfhesghhkvddrnhgvtheqnecuggftrfgrthhtvghrnhepteeffeevieeltdehtdfhlefftdehkeeuvdekjefhheeujefhgfeileelheegtdfhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrudejtddrudekfedrkeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrghnuggrlhhfsehgkhdvrdhnvghtpdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehkvghrnhgvlhdrohhrgh

Héllo all,

A quick reply, just to correct a mistype sentence about the issue !

Le 27/09/2021 à 15:47, Josh Boyer a écrit :
> On Sun, Sep 26, 2021 at 6:43 AM Pali Rohár <pali@kernel.org> wrote:
>> Hello Josh, Sharvari and other from NXP!
>>
>> On Saturday 25 September 2021 19:23:48 Gérald Kerma wrote:
>>> Correcting old marvell address to new nxp...
>>>
>>> Le 25/09/2021 à 19:19, Gérald Kerma a écrit :
>>>> Héllo All,
>>>>
>>>> I made some few tests on EspressoBin-Ultra from GlobalScaleTechnologies,
>>>> because of problem with the WiFi.
>>>>
>>>> I have done some quick tests on all the firmware of PCIEUSB-8997 using
>>>> the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
>>>>
>>>> Here is a summary of the tests :
>>>> - W16.68.10.p159 = KO
>>>> - W16.68.1.p195 = KO
>>>> - V16.68.1.p145 = OK
>>>> - 16.68.1.p140 = OK
>>>> - 16.68.1.p133 = OK
>>>> - 16.68.1.p97 = OK
>>>> - 16.68.1.p70 = KO
>> From this user test result can be seen that last two versions of
>> pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
>> official mainline linux kernel driver mwifiex were not properly tested
>> internally in NXP and are causing serious issues which make 8997 card
>> basically unusable.
>>
>> Sharvari and other NXP developers: Do you have some internal testing of
>> this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
>> wifi chips? Or are you aware of this issue and do you have in NXP some
>> workaround for it (e.g. at driver level)? Could you please look at this
>> serious issue and try to debug firmware and release a new version, as
>> this is obvious fatal error in firmware itself?
>>
>> Josh, how you in linux-firmware repository handle such, I must say,
>> "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
>> something else?
> We can revert if we need to, but I think it's not quite that simple.
>
>> Because when users starts upgrading linux-firmware packages in their
>> downstream distributions then basically wifi cards on this 8997 chips
>> with official mwifiex driver stops working.
> The first broken version was committed in Feb of 2019.  That's
> approaching 3 years ago.  Given that this is binary firmware, I have
> no idea what else may or may not be included in the updates in the
> meantime.
>
> josh
>
>>>> REF (and all details of tests) :
>>>> https://github.com/NXP/mwifiex-firmware/issues/1
>>>>
>>>>
>>>> Broken firmware :
>>>>
>>>> Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included into
>>>> linux-firmware repository by this pull request:
>>>> https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/
>>>> <https://lore.kernel.org/all/CA+5PVA5yQbjg3vaT7F8120B6ngLn7+sZC0OWt0KoUiQR9hS4FA@mail.gmail.com/>
>>>>
>>>> And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| by
>>>> this pull request:
>>>> https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/
>>>> <https://lore.kernel.org/linux-firmware/CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com/>
>>>>
>>>> Olders looks to works better.
>>>>
>>>> In quick tests, they allow more than 1 clients at a time !

In quick tests, they do *NOT* allow more than only 1 client at a time !

>>>> I am still testing the V16.68.1.p145 and report the results after some
>>>> longer use...
>>>>
>>>> Hopes it will help...
>>>> Regards,
>>>> Gérald Kerma
>>>> gandalf(at)gk2(dot)net
Gérald
