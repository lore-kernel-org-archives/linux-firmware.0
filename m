Return-Path: <SRS0=0ZsR=E2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29446C43458
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jun 2026 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EE5E1F00A3A; Tue, 30 Jun 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782831086;
	b=SwV90iPtTf6r3WNCDNdOfxZAWVwUZTf2uDnAtnbtOr0LZJIxglRw9CaPTI1M6OZD1cc6
	 fzicJQiBypI663mjxBmL6+570uUWpu934A4OtjsbUvcL75uJXs6pg2vSfBoa8XJ3sFe8s
	 ZP3ANvHWTgQMYKC2v9UFD2vScC0pZdFTumqJ1/+PaFe4ov7XO/x6uESV7ZntTTql2aLq+
	 QK6ruHW53AW55jitg12rjoJ2mpN4IBwqAG2Hp7EGqp9tk1pkVo1Rj535ADLAaqs2VGdjY
	 OY6FtntArsihOrcW4Q+qzCOTqC6LpaEe2Ws9ZlqqPngaeK6o60rpk3TRpUleD5GWYaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782831086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TQU+yGudOCSrlp1moLPTedJPAf6OKkDInV31YeaiJVo=;
	b=YfrikJAO94FEtVsIZ6oKHZ0p7okUZrp/BZWRU6gXhxwN1Ks+AcQ/K9UA1uZacQep9Sut
	 WzaO/M9NI+iD7q5nxMCUlTqgaFF9Ljxvi50EahcgMzGMefpdr2TPS6nBVeN8bKHrhGQWE
	 pkhfmQMh47A6Y/C4AiskZ5O9myZYHrbh6f+3MnHc+mgSvhuqlYM14JM6EP47pHar8fSCY
	 /CIV8RsYykHhYuF04buyGE/xuO7QC/bPL1jxYOvLYBLUTagrIDzr81eKeHpZZIwvBp3BD
	 lVnx8SL/k3c4yOfnh5bj7IaBfmlED6MmnzwgY5UCzsLxo4ScNOzLwHuXcR7o9WXfPfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PBBFD16P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdM4KDLn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5570F1F000E9
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PBBFD16P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdM4KDLn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5570F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDF5C2185858
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 14:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TQU+yGudOCSrlp1moLPTedJP
	Af6OKkDInV31YeaiJVo=; b=PBBFD16Pqg4NDVoqtgKoZzGCgDz5iRrvG2h9UBgQ
	lEg4YGKm5DAYCFJ0sIh9+m1Q+BQ448kNsBKoCMCC4iqyG8PBDTzXQEhToqGHV+6a
	4s56h3FEgftzF895SrprH0RcU/qdE6PB4+F6OznFWn2FMNHC62RzdKvzTrTciHA4
	8gqGR3RbSB3ESAiYAHhl7C4PCwqXSxUsML8K2eo7fbUy1SIudvLZWdfIZx/Y0OqV
	Bb1Z0pZesrcTPh+m8l3LoYdEQaetaDVBDCkUVpjEzqznU1FRhOvLJBcOIsVIMbgz
	pPN3T2pg6rjZYrco8dB/1rKuNFWEuNJf+HfsT5LlnHaSCA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862t9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 14:51:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd6e81f792so4314359e0c.3
        for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831083; x=1783435883; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQU+yGudOCSrlp1moLPTedJPAf6OKkDInV31YeaiJVo=;
        b=OdM4KDLntdVvdIPBGhAMD3wk0SmaOBPcasbs9BQvdTKKIIcHwgOpqcbLULhwo9neJ8
         zvL+uWOE8WeoP0RL6/nlR3AaVfyvT/986k4XlOEwbqHJFgQz4mLDToA0iItCFSilylYI
         P1a0ScIL6OFD0SkJc1gpJgTZ1dy6JG7gHLGsNnJyzuAHQQA02/oMK1/gnJDvuUr1ohcV
         OIGsSrVlOg2/W65Mw6L/FJ7wok7hRwL56CXsVxR8a4HTe7zxXSlw4Xs27/dYOt2FjKZL
         357lmsL0RUa2WfyXs1oZVBxa92jF71BjH0I8GNhaFWfUvnBy1k3HI+WKAWQWpriwQZpb
         xqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831083; x=1783435883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQU+yGudOCSrlp1moLPTedJPAf6OKkDInV31YeaiJVo=;
        b=rdKK2mZadGDiODLIeG56Z3GmLfdiin60xA6jCRLAp72btcFVZA23pa9JCnXzwdTbyY
         6x4BIjQC+0AYfa4NCiIfroWQOYCQ5D+gwrZBhMOxClquNUN+jq/N5wlHJYPy7+B7amIf
         Bd7I2wXpwK9+ElSPEaYk9WP+PrOsRZu97SgQ1ZRKxI//mYRlXUHuJoUXDYsGMduSZUy3
         D6YLbxc9m+dAhNrKqqt1HvrpMrAb/x44FIam0ZUh3srLPXiIoP9GXfMR2GDVyKD5aB2K
         FgKxvRvexSldbPYp914md4vxjLnMoOhsy9LBvGZYii2euBT2XignvCrxzvBev08cFm7X
         vJ8Q==
X-Gm-Message-State: AOJu0YwupjS7xouu0dIJWz7PzW/Mok2n04QfajToarkqNJksdBHPhlCo
	ps9rFjVYjMmMjfUNn5Wr7kysxT9X+dI96L0+qFM8ughQ9OW5p+d2+mVqljd3ov+Hz9KztkILhrL
	hz850Npj3+a4P5Dk32uh5bqKbIbSYYf3TWHhUS2v5vQAtnHZJV+0n8gpwW5ogioU=
X-Gm-Gg: AfdE7clS0UiCgTf88M9D3Lh25ew9WteKC28JCOGk7fEwmizi3gTVItnIMTUqp+n1nGB
	mQYQ3O0zYHZsVSu371RqUdoFaAijFSuq4uUkrl4I90jYslw1m2lyxnmLSErKtNI6jhmf3KPYKK/
	gTcyc3od7fFnSPsHMKcOwKzGi7mgJuxpmrdh1mgN6LHRPF6neLyWzB5KVNIhhzhksnuoHGqbroa
	ZTYlluHJ4CYClOlIwBI+j7XU2RyBVvMNOSW/g9sUFewLu6zxGCa1tUXmhHKuBjfNGDGFVg9V8+0
	7w8ZNxRS5q/Cvrf6t+9whhqmUEAJkRnZAUpNbrHOzt6Oe2Bu2luWxsLjfQFrwgafqli5h2+nRiO
	qEE9k7hYBUj7ErK9osXSohNRf9/OGO/tVfyyGvof/x163xZti/NN+QG62gHyZi3y6VmAHHM4JWn
	rwDGhIhSHxpzLpbaCIaWEtzVzF
X-Received: by 2002:a05:6122:390a:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5bdbedf8eb6mr1747490e0c.14.1782831083482;
        Tue, 30 Jun 2026 07:51:23 -0700 (PDT)
X-Received: by 2002:a05:6122:390a:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5bdbedf8eb6mr1747482e0c.14.1782831083063;
        Tue, 30 Jun 2026 07:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1d81d0f8sm6084321fa.9.2026.06.30.07.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:51:21 -0700 (PDT)
Date: Tue, 30 Jun 2026 17:51:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <qfov2eee6oinzf3kaz4cxlkkq6qggil4z5szpi77ovdm23pli5@iqydlop424wd>
References: <CAPgfiAHDaL_7=p_z_qYi-Y_Ct9rVJAaY7SoYBh2sd0eEXxGmMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgfiAHDaL_7=p_z_qYi-Y_Ct9rVJAaY7SoYBh2sd0eEXxGmMA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: V7XhpfHIqWFj2UPLDlvuRgf8gDTrLxT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX2yqQIhC6cKr5
 27cUIDq1bZHkvcpD5fAPaQJs0SSEDL9o0W6N98p0vChhWKSiYuyR14pNP0qorTAjPgLiOtJ5sTm
 43sjM26D6xXggAb94yk9m62v76euksXkYuAEBunQlUFeq4wfGSX4URXqb2YxnZS3kIdGWQ0F25v
 mYHTMPnAQJIWqMqRp0EXksXyN5bfRwl4Zfp10opDWfMv3d8AlDETT8xg7n4OoYSnZ6HmAqYbuFx
 cLYWq5U3jccsmEh987LZh9S5JlHMX8ir202UFmHudFfMDz2vH2uKWdlWXlytfLMIym+TK/72fiO
 50exiagdd34+QIc+iUMyvwzbz1s93wHFS8wEIDVRw6fv3nxlNktYsXwwa2D+JbN3KDt5GMbHjmH
 oIdDJo7yJUcyAYgVLyxJj4Iig3e5PgG0uJ1lfaRt67PRtPTRMYMjQX7R3rTE49q+lWlpDE43v2L
 9BEueLGyYe8VsNMYn9A==
X-Proofpoint-GUID: V7XhpfHIqWFj2UPLDlvuRgf8gDTrLxT8
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43d7ec cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=5zlxPQchOQfTOIuXUzIA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfXw5kCdqOyHX51
 jPzVvf2IeJWa5p2FhHaea9wmb1qD8dWav/eaOM/p2Cl1jjtVpW9pFZ1qd3UKDWqkO0mj9T/aifN
 g61HPExvJwryZ/EhdJ9yz62lSyDtt+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300139

On Tue, Jun 30, 2026 at 04:07:07PM +0530, Srikanth Katakam wrote:
> The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:

It seems the robot ignored this email. My guess is that it again got
sent as a HTML email. Why? If you can't send a normal, plain-text email,
ask your colleagues. Venkata has been sending the emails correctly (and
being accepted by the robot).

Another option is to start using merge requests on GitLab.

>   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53:01
> +0000)
> 
> 
> 
> are available in the git repository at:
> 
> 
> 
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> modem-fw-shikra6

Extra line wraps, etc., etc.

I don't know what prevents the robot from accepting it. But I'd ask to
sort out the emails.

> 
> 
> 
> for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:
> 
> 
> 
>   qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52
> +0530)

-- 
With best wishes
Dmitry
