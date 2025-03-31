Return-Path: <konstantin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED8DC3600B
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 13:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D3EFC4CEEB; Mon, 31 Mar 2025 13:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFF3C4CEE3;
	Mon, 31 Mar 2025 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743427952;
	bh=SoJAqso2klj3cZk7CmoA4FLQETXeYSQuWyUn97aufRU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=cbmYh2VeZ4rBI4ae2UVUxYVRvWQt3REUOs7nUXK5b2LYYwFfEjCv0K0kurokKn6as
	 U3e2z1Tsg8Stbe5xqhwDKXeTsPIbtPFxew793GZaBLSPN59ERh9GwHfde/BGN6vuny
	 /rWoggjKuAURiJCqkRHsUJQMhVO2VYjn1uV60ZSs=
Date: Mon, 31 Mar 2025 09:32:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jakob =?utf-8?B?w4U=?= <jakob.ahman@pm.me>, helpdesk@kernel.org, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: Downloads not working for file linux-firmware.git
Message-ID: <20250331-flawless-refined-unicorn-bb7730@lemur>
References: <kumGDjV7ju0cy6k0MkxvgQnOt8ak4IeW6jiFFVxlPcEqBLYv48PBBRsr6ketr42UHBC9rJtwzfl8_lbpGGBYLPw4vPoXBPtKYFDqdKs-Nr4=@pm.me>
 <CA+5PVA7sMU0ifg-ommdiOVs6bG5qRPYPYrXZ4yGx8MAnweMdyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA7sMU0ifg-ommdiOVs6bG5qRPYPYrXZ4yGx8MAnweMdyA@mail.gmail.com>

On Mon, Mar 31, 2025 at 09:17:45AM -0400, Josh Boyer wrote:
> Copying helpdesk for kernel.org
> 
> josh
> 
> On Mon, Mar 31, 2025 at 6:49 AM Jakob Å <jakob.ahman@pm.me> wrote:
> >
> > Hi, this (and other) link gives a 503 when trying to download:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20250311.tar.gz
> >
> > From this page:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

Snapshots are not guaranteed to work, especially in this age of AI crawlers
that routinely overwhelm our infrastructure. If you really need to download a
snapshot:

1. use curl or wget
2. download it from https://git.kernel.org (as opposed to web.git.kernel.org)

-K
