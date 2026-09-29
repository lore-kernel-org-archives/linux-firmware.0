Return-Path: <SRS0=nQoc=HV=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788CECA5FA5
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 13:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 435321F00893; Tue, 29 Sep 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790689402;
	b=binl1+GAcWRJykFs/sRg902qyoHk3mHwFUcxuz2SaZ7ffZfAqlJar5Ezm9cgLY7ikcu4
	 vS0yBeVF7n7FzsRqFAJOh2f5Dpt7XpsbQxKuETWe++2QK4o7UeAnjuJB3DqxQQdCwop0A
	 18e8se3ByeeyWEx0I93ZIxQjdyxfZmMbFDgrq7wecWiTK4BETXjLfA8G5Its7lw3dbeQ1
	 DIKyjWk+KJoVAm/gI9cJGHxDVweQxSwx346wNib5heKWXD5YnlYid4rpXBNaivQ8BdKCk
	 f05vsHk2buyYu8Tkci1vaOHPt+AnzKSq5J6TNSylZwmeaMpe1omrv2VR82oQrtdQ/+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790689402;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UI8KGr+203TTDDjM2zC+E9Wn2hBAPM2hhmWuZojDsvw=;
	b=glf8gTDnSmOhGRQyyuF7l5ck8PdA8IpHHQKI0FApWnRO3RVoL2QN25SLEkL1XomX5B0r
	 PVk9EmduFk3bJ+ggP3yl9sFsKaTx9plkHJUHGMJeEb0hbN7qWGrW44akQ2qM/mAP+lsi+
	 5kNQCW4zcvbEk3fFGxvKURLwKC2kdeX4BnlTITCydE+TGhhRWQitT8ZzKiK2wicp0dFMG
	 y9SJ35WLX8hsqe2127anb4z1NclGQ8gwwFn5gl1cw/BmfU52ipvlf81JKewSwA/Gz74Po
	 oxQSGD+JQgMStUnscMPqn3CLpO9j6ahv4/aI5QL7XWrP9T0qQYi15VgTZVOL8Sy0Rfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=mYeRp9gq;
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7B321F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=mYeRp9gq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A7B321F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UI8KGr+203TTDDjM2zC+E9Wn2hBAPM2hhmWuZojDsvw=; t=1790689401; x=1791899001; 
	b=mYeRp9gqHVOzcBeE6OjITr9wEyPtBO2jMSmBQWbiZosZwjrpcodSXUSayIYHckc2jBPcfLzokKV
	H1lzBhllxjDHyjD8ZL2WkV3fqAi9p2fV8U2UHWuLLee+ZrBzFxi5wGZpV6vL0qxuoEjFVNJ1GS+m8
	1YvpUGTdK32f2/OrrgbShw0B3P0VJ8zY1HSEtJu8AKapUXdm0uUfaGThlhSwAIw7ojsRWY9uhBKom
	aeM/WpioyMp95nn7kok7iLqeDT/B8vUPg2Uz5stxuQm32BQLiYYjl17aazu6bh8ibBN5QS/N/lKFu
	6aYTLm+HsNX20ulimhcNWbx5Srh4H/B8k9bw==;
Date: Tue, 29 Sep 2026 15:43:01 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: David Lin <yu-hao.lin@nxp.com>, Francesco Dolcini
 <francesco@dolcini.it>, Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>,
 =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "lukas@wunner.de" <lukas@wunner.de>
Subject: Re: [EXT] Re: mwifiex firmware mrvl/sd8987_uapsta.bin missing in
 the firmware git
Message-ID: <20260929154301.7c45c1be@kemnade.info>
In-Reply-To: <arqp7k55wqW5ZgCV@google.com>
References: <20240605160013.6bea8d4d@aktux>
	<_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
	<20240605174709.5043af8f@akair>
	<20240606101839.GA76158@francesco-nb>
	<PA4PR04MB9638D1FD47BFBFDDB096C778D1C02@PA4PR04MB9638.eurprd04.prod.outlook.com>
	<ZmlEny2W0nArOf1T@gaggiata.pivistrello.it>
	<PA4PR04MB96381A69AD86ED9C9E4AD9CDD1CD2@PA4PR04MB9638.eurprd04.prod.outlook.com>
	<20260925165814.567c9ab7@kemnade.info>
	<arag95IJHR5FiFo9@google.com>
	<20260926090026.22b00f57@kemnade.info>
	<arqp7k55wqW5ZgCV@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 10:54:54 -0700
Brian Norris <briannorris@chromium.org> wrote:

> On Sat, Sep 26, 2026 at 09:00:26AM +0200, Andreas Kemnade wrote:
> > There are rules what licenses might forbid and what not in LICENSE-CRITERIA.md.  
> 
> Ohhh, nice. I was looking for exactly such a file, but I was looking at
> a too-old copy of linux-firmware.git -- that seems to have appeared in
> the last few months.
> 
> > At least submitting it to the firmware repo (so from NXP sight a third
> > party repo) sounds like some permission for distribution.  
> 
> Reading that doc: actually, no, that doc seems to suggest otherwise. It

Maybe I was a bit unclear here. If it is submitted and accepted it feels
like some more safety.

> specifically delineates various "terms that will cause rejection", and
> it seems the current NXP license triggers several of those. NXP would
> almost certainly need to provide an updated license, not just a sign-off
> with their existing license.
> 
There are two licenses there: The one in the linux-firmware git repo
and the one in NXP's own firmware repo. But both would probably cause
rejection nowadays.  

> This seems entirely up to NXP to unblock. If they want to work within
> the open source community, then they need to learn to work with the
> rules of that community.
> 
Yes, the only thing others could do is to nag them about it.

Regards,
Andreas
