Return-Path: <SRS0=2q4d=KI=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128AFC43460
	for <linux-firmware@archiver.kernel.org>; Thu, 13 May 2021 09:38:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDE2961432; Thu, 13 May 2021 09:38:14 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3AA61285
	for <linux-firmware@kernel.org>; Thu, 13 May 2021 09:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E3AA61285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=pkshih@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 14D9c5a45003386, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 14D9c5a45003386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 13 May 2021 17:38:05 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 13 May 2021 17:38:03 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 13 May 2021 17:38:02 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1d8:ba7d:61ca:bd74]) by
 RTEXMBS04.realtek.com.tw ([fe80::1d8:ba7d:61ca:bd74%5]) with mapi id
 15.01.2106.013; Thu, 13 May 2021 17:38:02 +0800
From: Pkshih <pkshih@realtek.com>
To: Kalle Valo <kvalo@codeaurora.org>, Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: Request to update 8852a firmware of rtw89 to v0.13.8.0
Thread-Topic: Request to update 8852a firmware of rtw89 to v0.13.8.0
Thread-Index: Adc81c783/PxktaiQ9eK+o93SJZNPgJuqFZ///+LvoCAAtB+Yf//xshA
Date: Thu, 13 May 2021 09:38:01 +0000
Message-ID: <876c29841fcf4d21ab2440cbb5879de2@realtek.com>
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com>
        <87cztx87tr.fsf@tynnyri.adurom.net>
        <CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
 <87tun7i2rn.fsf@codeaurora.org>
In-Reply-To: <87tun7i2rn.fsf@codeaurora.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.146]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/5/13_=3F=3F_07:08:00?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/13/2021 09:21:46
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163627 [May 13 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pkshih@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Prob_Subject_IP_found}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/13/2021 09:24:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/13/2021 09:21:46
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163627 [May 13 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pkshih@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Prob_Subject_IP_found}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	realtek.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/13/2021 09:24:00



> -----Original Message-----
> From: kvalo=3Dcodeaurora.org@mg.codeaurora.org [mailto:kvalo=3Dcodeaurora=
.org@mg.codeaurora.org] On
> Behalf Of Kalle Valo
> Sent: Thursday, May 13, 2021 2:09 PM
> To: Brian Norris
> Cc: Pkshih; linux-firmware@kernel.org; linux-wireless@vger.kernel.org
> Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
>=20
> Brian Norris <briannorris@chromium.org> writes:
>=20
> > On Tue, May 11, 2021 at 11:05 AM Kalle Valo <kvalo@codeaurora.org> wrot=
e:
> >>
> >> Pkshih <pkshih@realtek.com> writes:
> >>
> >> > Please help to update 8852a firmware.
> >> > This is first time I send a pull request. If anything is wrong,
> >> > please let me know.
> >>
> >> rtw89 driver is not in upstream yet, and it has not been reviewed
> >> either. I recommend holding off pulling the firmware until the driver =
is
> >> reviewed.
> >
> > FWIW, preliminary rtw89 firmware was already merged. This is just an up=
date.
> >
> > I also wonder, what's the harm? People like me are actively testing
> > the early versions, and I've done a very barebones amount of review (I
> > hope to do more). It really helps me to have up-to-date firmware
> > published somewhere central -- I guess I can take GitHub instead, but
> > again, why not kernel.org? If anyone else is looking at testing, they
> > know where to get the pieces too, and we can compare results.
>=20
> It can create confusion to the users if during review we make changes
> how firmware files are handled. Some drivers have windows style .ini
> files which are not ok in an upstream driver, there could be changes in
> the file format etc.
>=20
> But I have no strong opinion here, my main motivation is just to try to
> keep things simple for maintaining the "interface" between
> linux-firmware and kernel wireless drivers. My preference is that the
> firmware files are ready for submission when a new driver is submitted
> for review, but the firmware files are submitted only after the driver
> is accepted.
>=20

I think I can maintain the firmware in GitHub before driver is accepted,
and add some information about firmware version and link in the cover of
patchset. Then, people can take proper firmware.

--
Ping-Ke


