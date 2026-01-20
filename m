Return-Path: <SRS0=bvUU=7Z=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBCCD262AD
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Jan 2026 23:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2237DC19424; Tue, 20 Jan 2026 23:36:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6168FC16AAE
	for <linux-firmware@kernel.org>; Tue, 20 Jan 2026 23:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6168FC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL0Oqr1531109
	for <linux-firmware@kernel.org>; Tue, 20 Jan 2026 23:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tJcK0tYt7I0Vs7ZJGh4/9+ip
	2D3d75U4kYcmJbtBhLA=; b=RWx63ktjBDpbsW5EydlP6x/nFXsBPGyIuaQfs350
	KHQYLxT9TH2i7iUd9R0dMqEa7P80P7KCk1nD3zbWPbSOy++ZrNY3ii8YF76RI+fg
	3acSayAX7Vn1+DLiovmdZKsoMQmmCns4Hs8O6JgQGiFCKl4K/fBNRnKSBL/KNTg4
	cZEG1apNdES68mQ05IptEWA8iao02XKAF5aFkxjtXGRP70pW4ZYRdHkGwXrxRR6s
	XoE5EJzbWhcYm1ZK7XUDk6XKNnSwKI6Fv1mtFOXmXTgbYNyf/+Q0lPzHylWElcs6
	pC/i5syHueDGGuzwFSZdoGjkOKMnt1sArIlVFuahDbAg5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83gf82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 Jan 2026 23:36:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a341ac9fso194607385a.3
        for <linux-firmware@kernel.org>; Tue, 20 Jan 2026 15:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768952207; x=1769557007; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJcK0tYt7I0Vs7ZJGh4/9+ip2D3d75U4kYcmJbtBhLA=;
        b=dU5vktbTWWe9mR8wT0Z85TZmeqm5JLiKC6PxEO2OuKs2B5+8T0dtFsyHKd0Rh+mEEI
         gKxJ9SX8zc1ml+U5KMX21EXhXvkJCdyG0Bsz6V5ZAcmIkxX8TktwYVRvKJCMnBU1+Hrh
         W6eDygqLVkJXlkYVk83g5BNfspAZqXilzZHMYbD15qeRx+g/D+fRez0YnvlzqouEJcPq
         lQ1W3lCSC5iW+fO2f+ks4/WZZWPIubEfBbOB4ee3gBmAb4VqZrgreLj0xWKmvl86uAws
         YM+yPJns3TX6ZfLpNY6FMJjvZnBHsHGqa/0lsfYEDmGK1SCtxhXVIhbopoae/iMUnUmA
         SNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768952207; x=1769557007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJcK0tYt7I0Vs7ZJGh4/9+ip2D3d75U4kYcmJbtBhLA=;
        b=DldzS2HubmRYjA/kgmlpNTe6rrJDFXXQxiWzroD9qsDdO2dkiZE6IA5jpLi1wkAxPM
         58NjHxWxxoNSUkamD8+7NXXwoae633GeW4hHzYGvhYdoFqrp2zjDDjIg9h+Lm3iG9RVu
         e6l4A0YZlndQZtpAZTGdyCfLo89Y4Oa64EQWKPfUE7InCN8jWjai1Mpz5ZBjreqKiLnr
         dGILsMxnGNXa7AW+0S0GR+r3HKdyU4/waADgKEYkJe20cbH+JhU41iaW/2KhbjS8k0k3
         vnuyGfEtLwZ+L0OvsvS2UFNmbGaVucf1bnV0UOoSyU1CRv09hhivzCcaidUujcpV4BLI
         uUlQ==
X-Gm-Message-State: AOJu0YxSx18HUF1CZVYCtsCyc52L0xJiG/RmYBcdxYKRiVzOxloPa3QV
	0KHMQPeiIw3hM7WrrOZnBpgIHp0IitjaNQX48GgHS9oiJIHHtga6QHwjYFf9pzZQQnKpXg+Qnfs
	o7eb76JKpSntdy7XPYu8sxAi6CrAuyYUGLad1FhzG0KQz1Aj6vRS6+mMeZqDnOMYTWtk/GtHteQ
	==
X-Gm-Gg: AZuq6aK0cm0TETPW9qgCI/NLfGdDhbJCShUIvnhLDEqfJW5wlNrj4X3MtWRRFSiRywB
	yZ37ijlYZqbewc+MtHspYqc5o93+kgMX/jeGU2bjNNEgWngtXNC+EZGhytEwKPaIeMlI+9XfkWs
	ljIPl0/88qbrk+bKCvxLXhptLkR6jn2frvuA05ZxzlIB6IRCsvoNVr9n88jv95hJXmGZa0ouXKG
	RaophMUKtIS5/uIhCCm22YeLN5jH5gWU+iWJp2gjtK3vTK8TPu5l3/bZVU8X0fXQlGTPiilcYu6
	Vj1iOr895cnUmSTBejYZcPXTDYxlT2DRtvX1bfZ3e5q/5rtd5631Ulaz4VCkAro2eCeq1mY87rR
	mEKuFXqWQ4qbo9CPafQMT51+oUsK/vgJ/q52YkwXlWx6mymEZ2o7VHIDO7vEzyawn9kuvvt6zML
	ViGwPCYfh751iNtdwEpE4smSs=
X-Received: by 2002:a05:620a:3710:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c6cce229admr446596285a.45.1768952206707;
        Tue, 20 Jan 2026 15:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c6cce229admr446593185a.45.1768952206138;
        Tue, 20 Jan 2026 15:36:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33f00fsm4472143e87.12.2026.01.20.15.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:36:45 -0800 (PST)
Date: Wed, 21 Jan 2026 01:36:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
        Ryan Huang <xin.huang@aeonsemi.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: update Aeonsemi AS21x1x firmware to 1.9.1
Message-ID: <htkipxs5s3lmkm65wrgsyouk5hh7iyno4aci6cbu5sba3swnw2@pxgawgx4yzmd>
References: <20260120212659.4454-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120212659.4454-1-ansuelsmth@gmail.com>
X-Proofpoint-GUID: bfIUKwjXE96Wgdc8s9Jfwbqku4kXsU24
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=69701190 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=yJdRlBq07QnwfYz5hlMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5NiBTYWx0ZWRfX15xCpMS9aoO8
 /5yoTYAuaCZcPig4Q/M/ynRd3WsUgphOIkfW5XFzMuiqzK1r7WRQyMPIolXxoAlVerEx3J7tz0g
 xlUtSHYciw+Z+M3Z5O4exApdbHYpQCa9UdEyBBt/XLA3OtRpY1AP3lMhhjXxgOEBPqp3FQdfsMS
 6nARkiJcKld630OGOsG1dGjJPY6lByZ3N3I7mdHBJzzd4CxahEUA2AtCO5a/WUjC1FHpmOSk4BA
 /rkf9sCojkAjaWgEOUl/RXrs2Zp1x+KCBEK/LS5BvHo/dx86NE7fAxjSDWGL52sBx042CQ12Bmq
 jvu4t7tctjGcwcjWOSbSCTb8/IU3tcUoBZ4DFwjTusR/nz2vdhz8kqFOi9ClDCfq3ntRlFDSTOB
 pZGeizqQhAjHG2UY6jGLgUu3oKYHbA0KXca+DCPK03P9whqgGmFjqjbjl6YWiLKBt+Hz3V2krY6
 +geWScyp0YI2NhA6D2w==
X-Proofpoint-ORIG-GUID: bfIUKwjXE96Wgdc8s9Jfwbqku4kXsU24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200196

On Tue, Jan 20, 2026 at 10:26:47PM +0100, Christian Marangi wrote:
> Update Aeonsemi AS21x1x firmware to version 1.9.1
> 
> This new version introduce new command to configure the DPC Rate
> Adaption to better configure the In Band support.
> 
> Also introduce some fixup for some specific scenario:
> 
> - 10G performance is optimized for unstandard RJ45 with WIFI filter
> - 100meter 10G performance is improved for setup of serial resistor on MDI trace
> - Auto crossover in force 100M mode / parallel detection issue fixed
> 
> (quoted from Aeonsemi release notice)

Can we please get Aeonsemi's ack on these changes?
I CC'd Ryan Huang.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  aeonsemi/as21x1x_fw.bin | Bin 261400 -> 290272 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
