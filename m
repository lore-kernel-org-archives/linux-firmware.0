Return-Path: <SRS0=o+AG=4O=lists.infradead.org=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1A9C4BA0B
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2020 04:46:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668B224653
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2020 04:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dw5fgtVJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofvWS/in"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668B224653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmBWOPgDGXMjx0At+t9EHkXcnt78nrQiLRRYeABfV14=; b=dw5fgtVJt7WaJC
	cv/x57c5/OeR1/nuCv9uKk3YhzsWQ3ZO40K7epI0iwi2Us4UAqFostQCRlou/eMiq9G+tSj6+vBaz
	K05Hef2G9zIaNkaH1VZ9otWosnchdQB6c32Fmekz0SUruugppKH5fFz0Xu6CCqp3NRbg6LDKJFbHn
	RJuhkLUnG5wpUcyaWQxVoLYDPQ5MJEfJ60diEPoKrnu2eY8xXk7flLHnP3ZdkmI3PYKfktmv+tlXg
	y4EwvWqkFCDk5FmHrVGgZ0tos4rzMRvyc7/gDpY1JLiIleVVuIONJ3e9LIQSv/QNum1xEpLbbP24E
	2MDbzcODZ5FFfUsYwEEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6oaC-0002bZ-Pm; Wed, 26 Feb 2020 04:46:04 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6oa9-0002Yt-GS
 for linux-arm-kernel@lists.infradead.org; Wed, 26 Feb 2020 04:46:03 +0000
Received: by mail-oi1-x241.google.com with SMTP id b18so1774413oie.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 25 Feb 2020 20:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKUyDP4lZW18OTJVqKNfcbTr/pNluBP+Ac8mA7k4evM=;
 b=ofvWS/inAusVCo3l1y8QovhX4A7p7BrHR3o/38cH5h/oY+oPPGklAZwzipfIf14QU6
 potN5ZirnfbpuqlD3FbwCDt68S2VNziAe29j031oaTGqS5jme9cfqbcq9aS2Ev3tHZ+Y
 4l+XyIFM0jvqUyCko5LHBk01vlk6v3SmOhxMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKUyDP4lZW18OTJVqKNfcbTr/pNluBP+Ac8mA7k4evM=;
 b=ItW2ZW0aNxyS32l9WkfD04TIiNwNPqCnpXcro0FE4OFUhEk/bSgzRV3qsfSfVEKOL0
 vGtan4t5Yga1nuMDc+Mqw3xuzbUSRd08VrdjImiTj+bkrn1CCg8zYVNlgNg+HvgacDtU
 JWtzR8jDMIIWkJy8ROtOYO6wW7I8BOd9OpNYCPODbMtRaG+W8teWVe7vPRbmuoVRpkxQ
 tp+NmmPpyLu966561z7E2SFRgQZ7RMcmpUqtQmpjAl98B4s9zHQxAA8oWLCrD9xBUM4V
 3H8S0NYjvpUyUwHfIFBJmyRnx0p+kkfREESALAzfEUL8xH7g1nqW7Olp2EyzbubRVoGh
 V7Cg==
X-Gm-Message-State: APjAAAWqe9D3nn3UU/ndzsrk2UJqh03ww5q9GRQcQniuCLaBn82xENXt
 GP7hihijYLAmHjfFpPi4vCelt2FWUMG1Ww==
X-Google-Smtp-Source: APXvYqzh+CsSKsJTd6J1J7Cc9MbeXZ/EvA2sRsmYC1brKS35H26H98DlniZhFxk14192Du3bZlf7BQ==
X-Received: by 2002:aca:d985:: with SMTP id q127mr1616037oig.132.1582692359743; 
 Tue, 25 Feb 2020 20:45:59 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
 [209.85.210.46])
 by smtp.gmail.com with ESMTPSA id k201sm359160oih.43.2020.02.25.20.45.58
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 20:45:59 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id j16so1815442otl.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 25 Feb 2020 20:45:58 -0800 (PST)
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr1449424otq.97.1582692357955; 
 Tue, 25 Feb 2020 20:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
 <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
 <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
 <1582690790.6276.19.camel@mhfsdcap03>
In-Reply-To: <1582690790.6276.19.camel@mhfsdcap03>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Feb 2020 13:45:46 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
Message-ID:
 <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_204601_783448_6190CFB3 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-firmware@kernel.org, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 PoChun.Lin@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20200226044546.RWGwjdiMS4Nrowo4MuGjy6UMvc9lYf-I_UjK2fpf6_8@z>

On Wed, Feb 26, 2020 at 1:20 PM gtk_ruiwang <gtk_ruiwang@mediatek.com> wrote:
>
> Dear Alex,
>
> Do you mean to create two symbolic link?
>
> lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_d.bin ->
> mediatek/mt8173/vpu_d.bin
> lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_p.bin ->
> mediatek/mt8173/vpu_p.bin

Yes, otherwise older kernels will become unable to use the firmware. I
don't know whether these are supposed to stay forever or whether we
can remove them after a while... presumably the former.

Also the WHENCE file should probably be updated to list the new files.

>
> we create them at the linux-firmware root folder.
>
> Thanks
> Best Regards
>
> On Wed, 2020-02-26 at 12:41 +0900, Alexandre Courbot wrote:
> > On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
> > >
> > > From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> > >
> > > Currently vpu_d.bin and vpu_p.bin are at the root of
> > > linux-firmware git tree, it's not appropriate so we move
> > > them to subfolder mediatek/mt8173
> > >
> > > Release Version: 1.1.4
> > >
> > > Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> > > ---
> > >  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
> > >  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
> > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > >  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
> > >  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)
> >
> > This is nice as it removes some stuff from the root, but for
> > compatibility with older kernels that don't know about the new path
> > shouldn't we at least temporarily create a symbolic link between the
> > old location and the new one?
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
