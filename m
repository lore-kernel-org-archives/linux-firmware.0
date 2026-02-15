Return-Path: <SRS0=nkiV=AT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC7EF585B
	for <linux-firmware@archiver.kernel.org>; Sun, 15 Feb 2026 01:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5395C19423; Sun, 15 Feb 2026 01:34:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1CF2C16AAE
	for <linux-firmware@kernel.org>; Sun, 15 Feb 2026 01:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1CF2C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F0uhoh3750282
	for <linux-firmware@kernel.org>; Sun, 15 Feb 2026 01:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w/7tT+st9qFCS4qsGH+d0Y7k
	bcD1MEAP+oU5ZQBob6s=; b=g/TsQNdW6Og1NjRzcBdmVvh6mFX3FRmJ0pCBUh6C
	WhqDFBnsW2TY2J0H6tWig9mr9MufOcw5kB9XiHWMpurz6MogKZpm9FYct1hAmJTG
	V9W3wp86Wns5ooPbkJpzLnhqF6T322Rv+vxFN4lravXD52XODcpvT8LAkFl0CCbf
	d8D/Zi5ZGuI+2V+Lrd1x9Xmae6/jle5S+VkyB1UJgA2tLlye6rFflgZgVkSWUoJl
	5PCT+rFYLEdA2ccwgJL1UBI4Eu9ooHVa50hXKjb7xpBFEOjghu2AlV9WAdWXKxVr
	IvReCzwmFM/TGYyvf90FdQV93zmiRG0FZcGpJk1GyMbosw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc1vge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 15 Feb 2026 01:34:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so803557285a.3
        for <linux-firmware@kernel.org>; Sat, 14 Feb 2026 17:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771119253; x=1771724053; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/7tT+st9qFCS4qsGH+d0Y7kbcD1MEAP+oU5ZQBob6s=;
        b=evZBXNT+bBFX0DH6piFcd7EY8YbKCsu2otvo3BhKHn9xlpqKOc3H2d1r9A/HEoG0pg
         cNFHg7/V2/a7hbA0Vj2Fo2+ibG5X5R7i5To/9gwh3dPyEvyqUdn2CsZlU11OEYQ4b5zn
         O+9f4KSYY5Y4oJSBASnAhuPF3C0KDeHjNEsD9tAZ8a/AfTLWuDPiciz2D+fJg4D2/n1m
         X4Du+x0//ZfNtHllw9vXsi1N/gtR8sdwfMDB3CIlzqUSXizg1Nk92+RiAPIW8ZWRMjps
         2AQMwnpRxVe6ISW3GDoY2q3A8pd3CBcU3Sknikr61qc1SMeQrWdFub0SxiZCS8EtsgCJ
         ATWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771119253; x=1771724053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/7tT+st9qFCS4qsGH+d0Y7kbcD1MEAP+oU5ZQBob6s=;
        b=dx4vTLHvB0Fp9e9aIN332ma6aiCDpUag1fV1iJgBulde1oIackeLwG0PRaeBicobq6
         d36Ot30eljKqzjFZ3u/H/yKS5fAmBLm6SCMJg8MbyB0xppgVzxkOVfoT2h0z+QrHhTJY
         v+GBjNdxOVHBqKAu+HUIhieblc4hnlDfR34mBtfwH95ZLWcXdtik10TLmSwLgkubPXyt
         TN4MZqSQtyus+mWO3WfztaBCuIxeJLKL1vz8eBoa2rlKO2Zo+xVj9G+7ldc74ncxkEi1
         Lsq2RFfRZQCizyZ+ZC3qN5SyVjhvIdSN+Me1UuQLumndNAW0ddEKGmjZDM32yz1P3BGa
         DFzA==
X-Gm-Message-State: AOJu0Ywpctv2Q/vgNNe7nzkzLaMZFt74z+ls8R6wHUqNb1cDOYPefJGq
	dPkO+OBQ/9P1Otj5zxBGbj6Yo7a0IuwTFYhJ92OJYQNI4qrokCgUzlngKg4AqY4pI5sxLi2cT7Y
	l7E3cUnvcYc/UBsH3Vz7YFKn9j30bL+V6jZ9HLhq0t5c+WZi5XzHkV0BJh7f72aU=
X-Gm-Gg: AZuq6aJxuFABp0mWZvxvqYaolK1wnA0/vF2K+KStaM/hMNQKTWyNSx9xlXvojI2RQgJ
	RoonbcV94RtMUAHlnKxlHHpcvrBEhjyHCglhqfWqylw4s06YWPzy9FD1/j7o6WUnKU9dJprJiHx
	DTh0sm1D31KcQA3Ns3ZAC62O22ACiW543b9PzWEHeP47wISa9khezXpNaqZnsg5hIsAOJS6FOuG
	0r9rK2T1NeVZYfgJSPBbyWRT7/Lifcu6wjaLDBGZW0jb5mlDgrErnDqcKPv8Ern1hKy/JNHoyJd
	dSJuMvJV4NjzE+apx0QkhJEJSwvvxeb9rCKpubPQpHibz0LVWQjY+cerxegPKXMWACnxDEP65mp
	pJS24D+a/tKaXLv+kpmOMMLnD+5/RzwMJQAAFF9vPy36RR94V2pVt6EiORrH/yBmVB5Uj4cRhzv
	XOnUND10cGeC6Db8PY13gMX6p/xcQo8VWil0o=
X-Received: by 2002:a05:620a:1711:b0:8c7:b0d:df16 with SMTP id af79cd13be357-8cb4c01dc82mr506672585a.62.1771119252723;
        Sat, 14 Feb 2026 17:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:1711:b0:8c7:b0d:df16 with SMTP id af79cd13be357-8cb4c01dc82mr506670285a.62.1771119252257;
        Sat, 14 Feb 2026 17:34:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a5148sm2463308e87.48.2026.02.14.17.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 17:34:10 -0800 (PST)
Date: Sun, 15 Feb 2026 03:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <4num2u76w74dgok6otbj2d6y7nuio7a4rb5dfawu5f2q6tpbtd@7ej3rxj2oh3z>
References: <9a5bb605-79ac-41d6-ac76-fe0085bbddab@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a5bb605-79ac-41d6-ac76-fe0085bbddab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=69912295 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=_SaLrwvSGj00LjmG_nQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: kxvAZSjMhuKfiFRksL8l_3igb98kj8e-
X-Proofpoint-GUID: kxvAZSjMhuKfiFRksL8l_3igb98kj8e-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDAxMCBTYWx0ZWRfX6S8TCa+/MxuO
 AptWBG9FiYRnxX++0+y3lETpPTKyXkb1vhCaSw/fLXWdOS3wJ0oHpgoRUuu4p8mIQYPhy8G6u0i
 Ya2Wox0jCiOQHex4D/c0lyY+rsyv8adLYA/O4LZlaVUqkiG8kVpLpQuNuQcn0GABUz34jiXHLK7
 Id8/QQZ3Gs1E+thjywVfKa374yBNR8Jv9inWwMrfvdAu1HaRQ1Ey4//Qexn3iL38nAy3AZFrdAG
 9IxoLpAAJqtO3vLqA9H60Y5brhdI+/LJwHCyUm/OcSycXQ7pXCMNMy62QNGM1ae9ASsPyRcgvgS
 jjfsXZYeYzBh8ZkDfIc83idhdrBHffrTjJol0ZLXxyY5VsvCkvOyVqpldad69q2Zo8ILfu32ORC
 Wnca019MJm/Fka4jsGKBjCC+kfbiFJt1RXflL+QBW86iEna4aJZJSRawsg38cVy3PzAmrl5EI6l
 Mk7VboQ7yPzdFUtzcgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150010

On Sat, Feb 14, 2026 at 10:47:45AM +0530, Venkata Kota wrote:
> The following changes since commit 5a21317b174f97c0fd62a5ccf1895ba47214f267:
> 
>   Merge branch 'robot/pr-0-1771002528' into 'main' (2026-02-13 17:16:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-monaco
> 
> for you to fetch changes up to 6a24a5a92c324f9aa1e8c267a2716fb71af309cb:
> 
>   qcom: Update DSP firmware for qcs8300 platform (2026-02-14 10:42:34 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcs8300 platform

Thanks! Merged and pushed out,

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/921

> 
>  WHENCE                  |   6 +++---
>  qcom/qcs8300/adsp.mbn   | Bin 6791168 -> 6799360 bytes
>  qcom/qcs8300/cdsp0.mbn  | Bin 3170304 -> 3174400 bytes
>  qcom/qcs8300/gpdsp0.mbn | Bin 5984256 -> 5992448 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
