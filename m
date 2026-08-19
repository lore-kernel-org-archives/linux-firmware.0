Return-Path: <SRS0=oJ+B=GM=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF61CC5DF6D
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Aug 2026 11:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B76451F00A3A; Wed, 19 Aug 2026 11:15:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787138110;
	b=07Jnv7VoBRBU6Kuxvy6E0E2ggflIjgI1O++yJI1KiZQgbRBGfjSwBaP3ZbOA9hw6qlJf
	 QY69q4bzsWs/HefGl+28Tb3m4X7aaWKuQufexUWrJmbXD6SLVGzs/DzaQfMCoX6jyLEhX
	 ehk2vqUEOYRBV+P9x8dIVUzysJkE+wdItUa3vhb+g8rGodsbL2oKx1Fbc3aKQ/Uvf7bD5
	 texp8uBv5isZ7YquPPYH2UUeQNAu5dtBoMxp1DvJ2SRTw4d6NR2UhtPPUYi7BB1zJ2Ij9
	 WL7xV7l0OMCeD/5NuIocu3iI87BF8Dadn7lJYeYy9pHFsRuUs3lIwhgPrEPFD8679fw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787138110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OyEpzZzaXEAZWiiPPz0Xp7cKTVfsQWkzYQiXYVqblxI=;
	b=OwLFhdFKXP42uW5LfQbfPlLYJxataaupKOV/eO4ZFlBEcNIqUwlCGURKVMET1GwWVdK2
	 l9DLelcvcqfCHqf57HxSnGaqGaHcgO/BlURqYkpABbn+622U4Xu+/UC98B0u+BxLjyyKy
	 F/oLPN5uRH/zRImoeUTv0c+ZPPLxlzhkmGMmyoIZ1zqwKt6l58H+rtZ6Pntki5rfVPqEt
	 /G/rVxaX5WCIhf145CknVgnzmpDkKY5gyy4e4VT92cl4RMilkWQPll48nCcjcOJUxKRzb
	 s6HtWrs+pewsuEXDqPA/iMr3lLeoXmn41hOiAXeYuM8hFVIL9u8eql9GOUkjVJ9baTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2zx7C4k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0GEVIfx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09EE21F000E9
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 11:15:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2zx7C4k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0GEVIfx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 09EE21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA85n3307180
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 11:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OyEpzZzaXEAZWiiPPz0Xp7cK
	TVfsQWkzYQiXYVqblxI=; b=Z2zx7C4kq/5rjT6Le06sH2N1gZgZ0Wp6Ix7BHve7
	Vf41fetSYWAsu0G2WCI+X9fDJ8lAi51RlarUaI1hSBuNcC2qdRRoKspbk/hh3cO6
	o+prsZXK3NqE09+tuoD4+E4Uz7mQFxZEKjZttkZsmXN46gx4/SMwMPLIMUycCLpi
	9iQDinJrOt01Nh3+cujeh9moE3Wz8TtIfH6fUrDAclvNGpuDqkFy+jqo6bbJtMQf
	f0RJa5UaNNAfcRsqtp2pXRVXk0pzqjnZN7abVUP+7o40W2ddxfVKPD6OBW9dFf5L
	ZtjXMr7L28IW96oxtGPF+jBZGwpTVQSgOcy+NlRPExGDvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmav6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 11:15:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso164143585a.0
        for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138108; x=1787742908; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OyEpzZzaXEAZWiiPPz0Xp7cKTVfsQWkzYQiXYVqblxI=;
        b=Y0GEVIfxgi2NKQKSKb7AvjlGbuCeHLAcC7QIysD3PLjcpwyvQ9HY3HxlgQ6iWb6pBB
         OYgPDUA/MoYt009fwEDhZDhA6yqxZEqCmpVp1xavzdHrkWg+df9672H/hSsHALvOjhzb
         TgHG0sH89IIBS1lQAdprA9KidHy0TT2+pt4zxNIdVPGz5Dc6/0CrhTe1qfwZD7wEwoL6
         yE51MYnf63ikKBQ1m1L3PvS1jL7A+69EFcHXY81bmfTIkIYSNJhCOaz/huUfDlrH83Yr
         cLbSqBSHoY4ctYBkOlwZdXdRlPy1lp8vJ7Nc55rUGkXhUI4eGY4a5CxM10gLdvD04+F8
         catg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138108; x=1787742908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyEpzZzaXEAZWiiPPz0Xp7cKTVfsQWkzYQiXYVqblxI=;
        b=qgkDujV81HxqT6xd5UNt6OP1GTAnrO1RLYQZE4B/HoRopTJnbTeqIoo4Gad++GRbXC
         H2FFk+qYmIGLS2lC9T2tuebHs/SiOmRDWqPPZZsE4hFpvLs8gnhe+nr/fnS5lOY0sGd1
         y5qSmeOrCmyLQ6jPKqvtM4uF8bEVe1CS7Q5V2liP7Xh6S9b9xENun5CWHsMNiZtzVXlj
         uT3VZOa58r/acR/D8lV81BXTUEBtW12Aw6HBqNWkDQfeILDaEZZL2Jic0RsM1aRweaAh
         EyUKdq8GXkbr/YdFpjK7r46p8/JHyD35b+omJSXunnrf3lxzcsx+ldWFxQ83hTtfuzsu
         P/Dw==
X-Gm-Message-State: AOJu0YyEvlgGOwSMab08uAtknZLmWRH36cGtw8nbzYvc5yCXkZtHgpzi
	qW7mIkCic45r8TSodAr7wDVYFDbzlc79Hz26VNJ/kuqBCCm2DNoJ1G+7tZDiDo1BKrwlqbxgFUr
	zFePiUk3NBxV3HxkgVp1S9QtaYzA/mVSNmIX/kIt+o3hpCoEye/cUHTBqsWBQsAs=
X-Gm-Gg: AR+sD10zzLBNZ7nvFy2h2d0KN416np9kWyBZpiafSuga6xp/S5CckTCOGL97msOflQu
	PcOmoiZcG5Kq+7/qhpvcjgKNz5eRu/nxPfp3Y7nLsSxSaOrWhv7vwwPpCfl2SnF+ynw6xYF9OP+
	8qWq9sXvqHjuB09RvF6iWmVUDmGPqDIFiWN3ns6qJUWHRGxij/t9XtSxKJYvNWaW8NGaOs0H/6D
	tQMm6vtv03bwudvcvYROULw5zNpD8sTSBEGGihx7aYGPwBvIBy2SHD5aEW6O354UTDhdWkRe4Fw
	vQwgZO/gRunXbnzSg+kGLrxRTdYvu97wRR/fPe9c2uSRYTu20hWvLDLJ+mWKLwT26V1iAqhyU+U
	Hb5RO4Xydp1/q7pCdmoH1ifZf2mrCBd21BaYs55O8+u/ClVY0OU0pA7Jtea5060xb36/aVbpBvK
	yPcJfQy+A+KgTQ
X-Received: by 2002:a05:620a:2711:b0:92e:fe10:3339 with SMTP id af79cd13be357-9371e65ce0cmr342083885a.47.1787138108114;
        Wed, 19 Aug 2026 04:15:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:92e:fe10:3339 with SMTP id af79cd13be357-9371e65ce0cmr342076685a.47.1787138107624;
        Wed, 19 Aug 2026 04:15:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189cfb924sm4375331fa.14.2026.08.19.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:15:06 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:15:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: add NSP firmware for nord platform
Message-ID: <4mc4lmxzz2kpwtmxja5zsgn32kmudut6kod3pfqvtesqwgf37v@jfnozyogszve>
References: <069ac343-254c-4ded-948b-9a78ad665ac2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069ac343-254c-4ded-948b-9a78ad665ac2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 826RuPSCBTQqJZDhRaSX1RMoyyeN2FkQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX9gkvNs36TVfe
 jGQtljco+YuGFJUgnvE/CPAAnmrzBudhWpMbotYYVndw9XP8R8/FyAFjqBKmFn5Dw7q6b8vgL8U
 P35BiOQRhCzSnNU1X1BtNqpvTyGFJuU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfXy9YutWPCTn8z
 01QUKgC01wD6KwFvTkX/d4lJ9mnys3duR25V1hytT2j6V0mQMCSQUyjtzaRqZwblEAA9dS8hTGc
 +ccZpGKHSH/bAMlTGAqzm3F4uvQYNIZec9bwZST0FHRVwn4DXdio3El0vuq9Q1F3eJDPgSsGGrn
 3L4lKGJshdeTWXRLZBDZW0qUhWUFz7u+TGnGIfYziLeJUjEcGeyIhv49J4kyHgBH6zMtzL3gz5F
 2tqbrrCVIerlrz5zq625TzMhFhJjILT+fUBXt2cKeu0hbvZdrtwWCLZjncILPmrwaWZmFWmqET4
 NaLsuQWVyB9iJ2zkXy/1AXeCcRTMUCFP/M9/yqjLIJAkIcG8nFhzOvqPjdsV37YtwCzDqes7qk5
 kQYx8P7MgQ+FRD8RjiAsJK9ojirsMron93/NhbobYUYsqDXJKBPsazGmGJFna0YVSXQa5atLYC4
 JAzxcw474pVYclK99UA==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85903c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=RpoCbEcn8Sk-96kK7MgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 826RuPSCBTQqJZDhRaSX1RMoyyeN2FkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190086

On Wed, Aug 19, 2026 at 02:38:08PM +0530, Venkata Kota wrote:
> The following changes since commit 0a6871b19abf5d6e024b5d208b101ae53e7fa0de:
> 
>   Merge branch 'robot/pr-0-1787066669' into 'main' (2026-08-18 15:29:47
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qli-dspfw-nord
> 
> for you to fetch changes up to 391e1aa5d6c425f6790df7a7266243b08d4fa177:
> 
>   qcom: add NSP firmware for nord platform (2026-08-19 14:33:54 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add NSP firmware for nord platform

Is it now common to all 4 NSPs?

> 
>  WHENCE                 |   6 ++++++
>  qcom/nord/cdsp.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nord/cdsp_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nord/cdspr.jsn    |  22 ++++++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 qcom/nord/cdsp.mbn
>  create mode 100644 qcom/nord/cdsp_dtb.mbn
>  create mode 100644 qcom/nord/cdspr.jsn

-- 
With best wishes
Dmitry
