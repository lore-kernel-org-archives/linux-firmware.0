Return-Path: <SRS0=o+AG=4O=lists.infradead.org=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB29C4BA0B
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2020 03:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEE02067C
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2020 03:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="acQgTlSb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kJDoUvS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEE02067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZu7JooB9mE+epDJgDh7DjEJhNTdRYAVOc88naYpEx8=; b=acQgTlSb0Qkd//
	TFZEU3+TVVSCnvXq55NJjU+0PVvEa1w42o4uS4GJfQqM4ONSsdMMTRCX1VrC5eBqxfiaqUHGPgjcq
	uJdmfmi0ftM6OF45JzyKjUpXOF2737OmQ9HxRy02C7mxini9d/u2zfpy34PFO6cOqNLvdS5f0wfkq
	7cIY81r0ugKU7ciCT3DBHV2jWaKMs9hy+l/4EPSuAyFtNqEqeuP0pynguzLR3YRDg3ctyTBF42Hza
	zMtNcdnDdQl0nlZ6CofpRiJfqjNp2Lt8oIw9wa+qkoHUjGibQeQOSXJZMiaFdfrWOyrIZue5UJ9SM
	bpT5lEG+xWzjeudpEoIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6naS-00074Z-Ry; Wed, 26 Feb 2020 03:42:16 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6naP-00072o-5G
 for linux-arm-kernel@lists.infradead.org; Wed, 26 Feb 2020 03:42:14 +0000
Received: by mail-ot1-x344.google.com with SMTP id b3so1680771otp.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 25 Feb 2020 19:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
 b=kJDoUvS6OOJk+ypY1EujEwgsPIKGLXE6pkmbSfiESFefGeQ4Nl1/uklyaEW0ZctjRf
 /BuGku1pbGbTJQkAKdFDT07ofldpcOno6F37PivyZNi0+RxqwzT/xWZ+7mdmIjlguqAH
 zHSYv7AFcb+vycN05DI991TYsea4JG/1ynAGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
 b=Lb3l3rp5vQMmY35rFwJaHrcbSD9pXcAurfA7d318r5lsr0Kh383SIE2C+EmMMr6DCn
 5EtJCkCq3BM4kOZD2FE3FBfmsGAci0adejw2ETdwAUGALEeyXGM9eo00afYOB/wUz95S
 ya+y67zsYuWwJwbwmoBZA6ZM/cfqSOa+Z5KRx7fQNv9VFG3VLsx37Ln8igAhuSqlA/IF
 0xEKLB446CAvvHj/tN5kVO92AMJIO676HwsGvk9XXI/JDIj96RFgePdOKZBQ97vDTrCj
 +dAtwpvnLwBOcyd4bJ4OQ2yDcitO5OtNB04qk4kQ6J5SVY9DEBGdueytDXg8zbPEOmhL
 wxVw==
X-Gm-Message-State: APjAAAUE86t9nkO0gsyKIMLWX9IYOTNY1m7Ryi3LmDeAqeKqIDvV0MKx
 rN2/dwg2tHa2faKPhiqgGXX1cIF4yxs=
X-Google-Smtp-Source: APXvYqwwmbqpjWh/CuW4ctyb6AiRhbvEbAVUjKfeZhrVfAqBtrL3dOO62Fo5sBSLB92XM2DDQ1eFYQ==
X-Received: by 2002:a05:6830:610:: with SMTP id
 w16mr1410157oti.239.1582688531325; 
 Tue, 25 Feb 2020 19:42:11 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182])
 by smtp.gmail.com with ESMTPSA id 60sm280243otu.45.2020.02.25.19.42.10
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 19:42:10 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id q81so1667948oig.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 25 Feb 2020 19:42:10 -0800 (PST)
X-Received: by 2002:aca:ab53:: with SMTP id u80mr1537577oie.94.1582688529944; 
 Tue, 25 Feb 2020 19:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
 <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Feb 2020 12:41:58 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Message-ID:
 <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_194213_219773_61A5F27A 
X-CRM114-Status: GOOD (  13.08  )
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
Message-ID: <20200226034158.Kf-rnKhQf-5FCNRUBcdpIGuhxVcnw2h9pMlOHArSILg@z>

On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
>
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
>
> Currently vpu_d.bin and vpu_p.bin are at the root of
> linux-firmware git tree, it's not appropriate so we move
> them to subfolder mediatek/mt8173
>
> Release Version: 1.1.4
>
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> ---
>  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
>  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
>  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)

This is nice as it removes some stuff from the root, but for
compatibility with older kernels that don't know about the new path
shouldn't we at least temporarily create a symbolic link between the
old location and the new one?

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
