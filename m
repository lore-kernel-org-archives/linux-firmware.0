Return-Path: <SRS0=oqNE=FO=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5495C44515
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jul 2026 10:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCBFD1F00A3D; Mon, 20 Jul 2026 10:31:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784543467;
	b=yUDcPikefCLhcJgq5gfuB2J+rUPldqYDvJ2S4ADU2V43y5YOoyibNKdd5Rdj87cJdHBD
	 XUUla8UGQTsIUAm+jCrRyRaTxql99LFiIZTUSskS4lH3bK2mXtSUacsqj2AsK9cMTACOB
	 nbSEY3ROEzIUfTVHzPFGCchiGKfM/8VWkFnKCfiyb7IPEMnkWQjd4xL8wALB/WqrUeIL2
	 jHUq4ysUIi7x9uPHggtxr7vKv43jPvzWgMWf8NwH+kxHuFQqyGP7QxyrbKAatpFOlbPKo
	 eDQTOekDC2ctf9oDjHbxlLWUk63iJc5CkAoAaNAKETiuktOe0r0moE6GHOfvqT3CGfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784543467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FoqXlimhYPcLYEi56bTGVGekLrLwuOsEedZMHfBPp6o=;
	b=vbi1q7QP+UymJkcDv8uNgAcsjKAzWzztFiS745bdp9uc09eZKsbGutZ8webn/E2NW7Ph
	 QDXqwMa1NpIe8VaL5FL2P3IlQp8fMa3Kb6u9d2bKVb1ydaepuS0u4QLp6c/l6uaWANa9o
	 M3lSEkkR0nk4bdJWum8n2r8C8YBa2OAsMXye6AVHrSJqxezft1HLLUYDWKPv2vf0go82C
	 6UpoE+6toqiALBMSxCWE9jfCvkbEwYGdqJ1KdxI1cRQG6GlkZ73/GRxWZQo51bG/GQyBZ
	 Ns1xsqXpmdbw1SJoPx2t787p2oE2FSWYP2a2aIgDyNVWu2xQYARubScftS6YQtMeE0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LbaAtrBc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKFMTIRz;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2868A1F00A3A
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LbaAtrBc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKFMTIRz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2868A1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vTY02282415
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FoqXlimhYPcLYEi56bTGVGek
	LrLwuOsEedZMHfBPp6o=; b=LbaAtrBck9YFl+kTYuN5LCJjZvSXy9zQc2Th1MrB
	JQmCSIruOG3R2ykq7Xz82ttawN38n5Tl+3/6R1qNki8YqBPjrgq4miVtuUPN5IQ3
	bXQKNlsVGhTYNbKOethnuUdzdxxxfVW42LjwMrB4Ey54Vvp0IEc4JPDb/JIRgf4d
	6Ch8U9oHhezXV2dGISHY7BnfwDtoIE7+wbFYV3JMZuxegrT1w4LaAtuqwzSO9vqU
	CiL/WTloiQ/7xw9EoOav1G6bSaSg/qRAj6fbWLjtk1LaboW+gku+JbC2AXmYXncA
	ctmEaKCkmAow4ViNTE8l/adyEuMki1Cw57GO0QO/V7rDaw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgn2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:31:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e80385dbso3033411137.1
        for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784543465; x=1785148265; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoqXlimhYPcLYEi56bTGVGekLrLwuOsEedZMHfBPp6o=;
        b=EKFMTIRzE/kFDpEeQjprwI/fOL5yzmyTJMNhEh8uoMSC+A/g0wDO8xjG2aqjo9FD5E
         //ND9+6p5pqMDbmXKFL0mKB5/rszwfw4duCvP5l8mTyNzPWMapNTy6W1fKPpAUni4B0a
         LELOitmLp59r4vdLovmW84T5AX8ncm0XkNinjpc1fDu4vk8DvmIXsiT5Q0OjofqwMWFI
         Kh4eZJGhH4MeAZ5A5hxbavYk5438Fontz4k/2r44j9uYulVFXNVaq0Q5mjWoWKpyoveu
         UClO7/OegWQuxzIJyP41u+42VAU0IcRHR4KZCLi3wiXQ0I/NgL1wliVAfwRsViwT7wue
         74FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543465; x=1785148265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoqXlimhYPcLYEi56bTGVGekLrLwuOsEedZMHfBPp6o=;
        b=AjuaFuacktVTQ6pQ9wcfvIk5YLx0XVNjnxOm98FydxqxdPvrvWiRdFdP/NFhsh533G
         R1yKNQw7CwX8BOvF1vGg6IpjO+mjzAoghkUHwBCWMLmQs7wawkONQC4oqumr0LqyDTvF
         +A5Ea/MchB0P6Upx9iBQ8pkZFnM6uXRZXga72fMvvwpiE+opX9QRd/4dHnOqP6JhRrvL
         YQiFRzY/NtDO6MbK0edIa+wpA4VmOW1P7l8m2GNoay9K5tgmah4k7IG2ZfZsXgba5ONw
         tGCzo9y2TIDZoHqpF3fciwoVHpGflOxKh7VJY5hjf0mZ5Mcvyq42dSaPyUAYnZ8KH7I9
         eQqQ==
X-Gm-Message-State: AOJu0YxXfUDryxGkmE2kmkUNCR5pgbMgLUjgjZox4L9Hb23gcdZJYIsI
	srlvLfX+9t6ajNFDRge2QBvCJGv9LxDNTssPE5iyIJhApYM+KXYwMYpJ8+qRPplkXTuDhlmbq37
	iM32pUOu8rgSVb2qUncliiVo8C6IxtiVr5Y5UTzVex+LgZTrSxctmGp52rBzzD1eXNdGuyCg=
X-Gm-Gg: AfdE7ckUdV/Bn0w8NZEEh1Hop00lRNi6G+Qt4c+uLqL3zEIfKrmnI8fevW7y5p9e1MZ
	bfKj/U25Gtr9qpQm9wz+ZSB6xxbnMzW5QWcwqFfA13GgdKjIpJLl6Ld6boJYiGpcTKEji9OaUIS
	Oafn5KwRC2f0gCJt1vnOkcgVwZCiygTa3PT3jXLGl63fedEA8QdJCJqbphieworPAD36mmgcA2B
	hmwJDOwoNne7KSh9BOylUncHAZBI1le+6Y6yD2G29D8D0bnS+w6AilHMPP91PzCzHk8BT2hbS6M
	UYO07Ho99kyKDs4jC5P+6uOOqUtK35VzOdEHfDtKc7sDZ7j3UIqQj5YBJ9OPnBck4aH7IJfRt3N
	mpv5iP8Nm8Djd/hlm7fzQ3E5fI5i1SnooNs8fK8LZFl4204MDnh3MtLD5N0N21iuWp/311sZHo2
	A5G8NaycYEEx3PGw==
X-Received: by 2002:a05:6102:508b:b0:737:e354:4092 with SMTP id ada2fe7eead31-747534dcbcdmr3285485137.11.1784543465313;
        Mon, 20 Jul 2026 03:31:05 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:737:e354:4092 with SMTP id ada2fe7eead31-747534dcbcdmr3285476137.11.1784543464824;
        Mon, 20 Jul 2026 03:31:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4e7ba52sm13630871fa.15.2026.07.20.03.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:31:03 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <m3cygxqycdqrb2gvteuhba6pmyljk5u3qtz3czjpjji3lp3fb7@4o3tbgipo5qr>
References: <73c49178-d2fb-4a2d-9ded-7c18c41f06bd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73c49178-d2fb-4a2d-9ded-7c18c41f06bd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5df8ea cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=IweXbU_awre3L9gfq4cA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNiBTYWx0ZWRfX1qcwklfsRDYG
 Da/HwbAJlI/HDVEAGzV8cu3jXn5XmhOR/B0xGdqhOzK84dmXH+JGWBmK/H5O0YQmhH74kFlzVeP
 EUXEBGZR/AYfKWyIo2w+1vg9hLobXoQ=
X-Proofpoint-GUID: UwODPuIxHFrirnnvSd4P8omuIpPnEWTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNiBTYWx0ZWRfX2WzsZT21Yyzp
 jB2M/ypNGJNVwb4h7qdtC80YpSsFDUaDzDf2rFoUDY8Tpy7/cwtpOCESszprutfFOp3P8DtQcjw
 fol/JvCRvWN0VTp/2BnkELsY8m9+OzlcPrw+kxTm0o9/CtZjzfPu2XcDVJShg7Qxlpr8SCaOXE0
 MqcgTekXW/SaDLr2p0zDdtyz5DTh3zM+NuWHliVv4sM115vfM+b0A/N5VZ7fT1+1SRxXwpnufoR
 NMooDl6uuRFFGpdiWp8y8XBv+yMKkjCmuNI+VlmTDVWdzRe2G1kfX75n2exObnj6HTaQhJATtuU
 S6oLgzNHMpmiaBDK482zgyxoUYQY2Q3U8idDtKmZP6v6qy+FTtY7FF5MKaIIPI+hREld5+62d+1
 22Fpk3L0K2boZGg10OzsRkhS57UAtoJff1gbyMvukPIc1QZ1IRNDHTNQAr76qHQQDZiLa9tW1ux
 E+EMGvmY2kqCWt6wcWA==
X-Proofpoint-ORIG-GUID: UwODPuIxHFrirnnvSd4P8omuIpPnEWTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200116

On Wed, Jul 15, 2026 at 10:23:27AM +0530, Venkata Kota wrote:
> The following changes since commit 2c35b1ed46f661baaf14b08cebb9201ca802f939:
> 
> for you to fetch changes up to 0b1b0d6f1623e3903ef86dc15a69ede64780f838:
> 
>   qcom: Update DSP firmware for sa8775p platform (2026-07-15 10:20:30 +0530)

Thanks, merged at https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1139


-- 
With best wishes
Dmitry
