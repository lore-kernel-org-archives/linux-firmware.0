Return-Path: <SRS0=mcuX=A6=notk.org=adrien@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26876C7EE22
	for <linux-firmware@archiver.kernel.org>; Tue,  9 May 2023 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE993C433EF; Tue,  9 May 2023 13:29:13 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5D09C4339E;
	Tue,  9 May 2023 13:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5D09C4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=notk.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=notk.org
Received: from smtp.notk.org (nautica.notk.org [91.121.71.147])
	by nautica.notk.org (Postfix) with ESMTPSA id D33D5C009;
	Tue,  9 May 2023 15:29:06 +0200 (CEST)
Date: Tue, 9 May 2023 15:29:06 +0200
From: Adrien Nader <adrien@notk.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [RFC] global: de-duplicate files with symlinks
Message-ID: <20230509132906.fp6ujkrasz6z3vly@notk.org>
References: <20230331115739.bytw7s35aacgrqic@notk.org>
 <CA+5PVA4KPx8TzS5+QZ6ubg__cz9gYKtmR-kFOv9A3HYVS8nuww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA4KPx8TzS5+QZ6ubg__cz9gYKtmR-kFOv9A3HYVS8nuww@mail.gmail.com>

Hi,

On Mon, May 08, 2023, Josh Boyer wrote:
> On Fri, Mar 31, 2023 at 7:57 AM Adrien Nader <adrien@notk.org> wrote:
> >
> > Hi,
> >
> > I initially wanted to post a patch but I think this warrants some
> > discussion instead: de-duplication only works if further commits don't
> > introduce duplicates. This is doable but also a change of habits and an
> > extra step.
> > I'd like to discuss this nonetheless in order to reach a conclusion as
> > to where is the best place for this de-duplication: linux-firmware.git
> > or distributions when packaging.
> 
> I've been thinking about this for a while.  Generally speaking, this
> sounds like one of those really good ideas that in the end I'm not
> sure we're going to be comfortable doing retroactively.
> 
> The firmware submissions are redistributable by requirement, but we
> take them as they are sent under the terms they are submitted under.
> If a submitter has sent multiple identical files in the past, perhaps
> they had reason to do so that never played out in the end.  It's all
> binary blobs that are effectively impossible to actually review, and
> already hard enough to get companies to submit their firmware.
> 
> Going forward, we could run a de-duplication pre-check before commit
> and ask them to resubmit, but I don't want to go through and
> retroactively seek out acknowledgement for previous submissions.

First of all, sorry for not sending an e-mail earlier. I have actually
prepared a corresponding patch weeks ago but I didn't want to send a
patch and then have no time to handle comments.

I understand the issue with de-duplicating retroactively. I don't think
that doing it at install-time or even later on is a huge issue. It's
only an optimization and users of this repo can reasonably be expected
to be knowledgeable.

My concern is that running jdupes is not necessarily reproducible (at
least I'm not aware of any guarantees and I think the rule is that the
first file found remains unchanged while the subsequent duplicates
become symlinks).

A fairly obvious solution is to keep existing files as-is and
de-duplicate only the new ones (enforced with "make check"). This makes
it possible to have a distribution patch to de-duplicate past files and
not worry about updating it for new files; it also wouldn't hinder
reproducible builds.

There's still a small possible issue with symlinks for de-duplication.
Consider the following identical files: "gen1.fw", "gen2.fw", "gen3.fw";
if the duplicates become symlink that point to "gen1.fw" and the company
behind this decides to not support "gen1" hardware anymore, they might
not want to keep symlinks that way. I'm not sure this is more than a
hypothetical issue however that could be handled easily anyway.

-- 
Adrien
