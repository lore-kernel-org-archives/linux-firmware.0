Return-Path: <SRS0=YtFo=DK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98499CD37B6
	for <linux-firmware@archiver.kernel.org>; Wed, 13 May 2026 07:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6957BC2BCC6; Wed, 13 May 2026 07:08:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FCF0C2BCB7
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 07:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FCF0C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ihsZ2965293
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 07:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4nZY+XKvL7I6mGUYhSgiCGQq
	EgqO8lfxD0yMotVD41c=; b=eV0aGEvK/Hh+j/j/1qEqd9xH1VKJxuysnkJTW335
	lBm6Jug11XJpN3OLUXiuBalrkOSHa0ad1ztC+N8Rhsa130157Ib8CaJnhDG6ZVJQ
	5xzsIA8KwhZ6CboLm8HkzRg9K88hFtn66fHTwJb5f934I/m8A0BQi1LZCzzXrmNc
	k4zkn3zOItUZbF7oHrHYm0hhhaTp4XoljaS0PJtZ2+78LKipYjUsRCGdhEKz4Ye1
	5IcvG725i4GdNgK3t3pJG4saGllEhqvFLFcrDi1cxgq9aUbm7tD80kXeJTV+qu4Y
	0DvTHLVXQdx7bft96fO9y01Vj+OXw/kmhzv9Wz0wihxSHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5830n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 07:08:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so76931425ad.0
        for <linux-firmware@kernel.org>; Wed, 13 May 2026 00:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778656115; cv=none;
        d=google.com; s=arc-20240605;
        b=FPjGg2KPuM+kR3LsHNKFNuHTUd0o6YC/97y2SO5ACL32ekmpy0vcTm9RbFKk5d7a1K
         Axi0Ca0vD9dMFWNmSfbB1PVPxG5fL60kOsh5BQQAgJB0HKOMBDavtbYAmI6sJdJACZs8
         ZndXnOg6hfJfeRZGQHOgklJZnZbKjR0RJRzrSNHB7rIWYOtdQaPdVrASU0vH8467o7CL
         5BmDnz7wL9oBX7XIM2mfuR8MhxwtrzV5vHmeNpQs5LLhMfsWwomAQoGanabnmzwus1eF
         VfbNLwUalC3voG7+gULqFp9MkCGYR5ALgmkx1xVCa3uk3A4hEHX7dlyfSIr2es5AQEcw
         XqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4nZY+XKvL7I6mGUYhSgiCGQqEgqO8lfxD0yMotVD41c=;
        fh=+nA9r9eC/G1paVc+cf1KN16lg/W3UFomrF0Z+HUNnoI=;
        b=U2NWC09Lkxpvdof7rgWYgHYwbQthkwhC9h6uT+dCjxnn+izNHiW5o/Dhh2MoLXDnzA
         YZTL+zk/vc83NQEgC/zvUIfDNbZ+UGkJzv+Uu+MDrn3phKQd0yZD3sROX6AQWS3jbWw3
         j1mjoc7+CSvuyHPY6Uj4nYmLkWe0fVpN8z62wn4WB6vrnts27eFzcA7KTdD+qJeJdRGR
         jffhmaDeOgvwvpbPxJGpdu2ZdiVsRlqOJE4V3TFJ8/YCZ4xdr7f5bj5pKKnPK5iZmxY/
         2BGstDEan7edsTnrn4sRfChHtVH2TGguZzem98bBHa9LFtVnd8geSwfkicuPwK2BaKzE
         hWkQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778656115; x=1779260915; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4nZY+XKvL7I6mGUYhSgiCGQqEgqO8lfxD0yMotVD41c=;
        b=fR1yikL3FHghuKv+t3CZ+TjILW0vaiUOfBHdWyi/dLJc64jnGZFQWkublfYBp8NpOW
         e2C8RZOEGcXnXTlf/ZZqsyE3qKqwH8PIVaPhOMujZR3WGo8499Qj5ILqLLkL76xAPH/7
         hHeY7VIVqDy2Uh2z5pmyPKtXlQYIsYzZiapBznIujwRneIpOk7t7yMekdHRsPEW+LXL1
         MTistnHsM3a4vm98s+eBmv7cgDFfYaTuax1uEbiCcgriNP/n8WFHIMJ9bDZyuOjKH7AO
         5GvWUXGwfATESGRk1lAPgTc4WzHSmjrgc5mED3ypiNL/IeHyR83bA/WA1dXXbe8g6TIb
         sMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656115; x=1779260915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nZY+XKvL7I6mGUYhSgiCGQqEgqO8lfxD0yMotVD41c=;
        b=WHTm3Z8GZsjzw3N7mL+OQA/tOutHkKymjgf7zqCUKLP7jIRd4GFqb3yb5lhfNc4i0U
         UVgWCX7rqigriU+fl1dDCDlnuJsQvDsFYkjGjdts4sMw5e33LplUoWcMaQ8MCABgYGlY
         qU8V5uld1YhsUkgS4qDdl2zBeer/XYlMPraQGZKCqfC79Tse5t7SArwhIs7a5Uu3SRy/
         2juilMTgNRZ30p0vFCdbuHKp/ItJ4XoVxz+5DD2ZZ2KIT2K5lLTOK8yz12aFgMbYHXUD
         Yrc5hjZioh/CarQkiXRWP0lpHNHiUQOYgH6MCUl7I3sS3A+5dD05zEmn40H1T0GFQuf1
         Qp7A==
X-Gm-Message-State: AOJu0Yy5NzSlZuwi+srphCQA7J8HpUjkzdXlqmIBPXppW8HNbj+MBuId
	txiYRtp2Aj4AfffNBVLgAe4ErXP7zoLZhKFIBaw/NuSswwKr7IbLmmBpRRa2CwmONGGIud3roKP
	4JvMgY9AtxO5Dsmgw4y0jAx0SH+84KFKQ+prAVcSewOLQFpP3H+OtH89CS+CrYP47UGfmApXi5o
	4zJSQCBFz1AXKUnjxXn/AT/Gnnv1z+XK9oSlfzUw==
X-Gm-Gg: Acq92OGDMigVuNtCJy0HzoKIqxj5Ni9v83V7utL/4eBb3Cy3U6g+FE3hEi5C7XNDDaS
	1arMK0eNfD+N6nkJB5zLRkBJOPrrBj7ppta4LLFLAqgmqnu6d2ux+1dO2a/7Lr3PnIVPA4CxK4J
	X+ULPs4b1RkQrE1/zyRrmgulX3Rn6amabwyD4/xwPXjg18VpCsyhC+PS/pQY64VYpbUqmGaZdEC
	i5LOoox4IkXWuxDe4RWG7Mr+fCdq3TfXX5m8Q==
X-Received: by 2002:a17:902:bf0a:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2bcfd48aa93mr43724055ad.22.1778656114709;
        Wed, 13 May 2026 00:08:34 -0700 (PDT)
X-Received: by 2002:a17:902:bf0a:b0:2b2:5099:2f40 with SMTP id
 d9443c01a7336-2bcfd48aa93mr43723855ad.22.1778656114149; Wed, 13 May 2026
 00:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <2d982640-1f8d-47e1-b626-2e40d69eba98@oss.qualcomm.com>
 <xfmj6boz5a4lbu2lvgnpmrikjkfcbgbog7ue25bo5medqbe25v@zidc6g26ukza> <82786487-264e-4cd5-bb2c-dcae9813de4c@oss.qualcomm.com>
In-Reply-To: <82786487-264e-4cd5-bb2c-dcae9813de4c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:08:22 +0300
X-Gm-Features: AVHnY4IO3cFPI19zCIWt4MkTSM3ES4eux9NmoBe53WVwwrLntTNmLaCJItVY85E
Message-ID: <CAO9ioeV9r-08XKKhEDbG2tDsKZuh8Pzau6TYuKnL+_Z7Gn5_mA@mail.gmail.com>
Subject: Re: qcom: Add cdsp1r.jsn for sa8775p platform
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3MSBTYWx0ZWRfXwqhJCnYRBbak
 QaRPNLw2baZTY9x+YvYCBL08jCDefj0VwUKQ7a0na8YuyS6Vc/+DOmgFqnHPN7kPXvY4v5QA7oA
 La8RZ2aZsJ9XkGX3U2TDH+eBt9egEfwJRtQo0XRZjCc3+vg8/Tdzt5LP54l3uw5JjQs+lFVjjA+
 ERL+yrbFMzQXcUtG/Y0YXuwMfQeaeRjf/2UqEZjT6/McDTJLhXN5BmABYF3qCsr5IrwttNsfhGL
 Wy4ISALzfwhv2WgK3xVKGBkQla7dEvKSgCLGRiXEMXQlVf3Rq4V9cG73rXer3agmmFZ48tept3a
 Wyi048BdjwLVVazzXIIbbiYRUn6Q3W17XhAqexSRwDa3Z5j6mrDIkGDEPHdXwgIkYu/fbGkSASs
 zn7/9UNTGsTUqyv+yAUAj8GKP3DRUDNcnibElD5ILVywrLxpzbEIONO/FGhjteOlu7Lv2KeZ0JE
 ySmwXjLaJR/SH0nqPhQ==
X-Proofpoint-ORIG-GUID: xOIATfWS-p4CNvO8wdL4_smruysoLJNU
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a042373 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=DJEVgTTCnRLATihGeqUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: xOIATfWS-p4CNvO8wdL4_smruysoLJNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130071

On Wed, 13 May 2026 at 09:58, Saddam Patan
<saddam.patan@oss.qualcomm.com> wrote:
>
>
>
> On 5/12/2026 9:05 PM, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 07:30:28PM +0530, Saddam Patan wrote:
> >>
> >> The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:
> >>
> >>    Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dsp-fw-lemans
> >>
> >> for you to fetch changes up to 6a81adce2fbb4e281a7508fffa76f8fbeed79996:
> >>
> >>    qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-12 19:08:11 +0530)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 3a88a751..34abea5f 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -7040,6 +7040,7 @@ RawFile: qcom/sa8775p/adspr.jsn
> >   RawFile: qcom/sa8775p/adspua.jsn
> >   File: qcom/sa8775p/cdsp0.mbn
> >   Version: DSP.AT.1.0.1-00196-LEMANS-2
> > +RawFile: qcom/sa8775p/cdsp1r.jsn
> >   File: qcom/sa8775p/cdsp1.mbn
> >   Version: DSP.AT.1.0.1-00196-LEMANS-2
> >   RawFile: qcom/sa8775p/cdspr.jsn
> >
> > This is the strange place for the file. If you were to keep the entries
> > sorted, then cdsp1r.jsn should come after cdsp1.mbn. Please correct it.
>
> Added after cdsp1.mbn.

Added where? Please send new pull request.

-- 
With best wishes
Dmitry
