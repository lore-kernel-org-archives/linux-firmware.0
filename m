Return-Path: <SRS0=1bc9=FK=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9011FC4450A
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jul 2026 13:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6359B1F000E9; Thu, 16 Jul 2026 13:51:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784209903;
	b=w3HwVgs738ywjHu3MmKLgDviovJLZgjzDHt/JVG0yUfJAUMI/7aVf9ya8PBw5J2w5YLK
	 xolzPZkLkOuMAPP97RDYEYbfNy9+7pi5Tuy+BvfUYtrxvbKsUehMpYmeVBnmRwmtZnutY
	 ODw3JoKqeY46LRby524lKiBE2DjaeLqV+ZalhOI/QhDgYGvlIWqy8C+2qjkkq/79E6auN
	 k89o6znU+Z57DrtYmk6z3fVMWdkJ/0rJQwQIi+19nBoDor8QTRZ+ozBAuQKiQNNfNR4Ip
	 rqYt3dEGr7aMvS3BHopxjU5/rnlgSMj7+u6HH2ZRmBynK3vzDcz0NuYqU7CgIxgngMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784209903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:List-Id:To:References:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yl0OmHzVBLs2lSZRX8zFg43M6Hk72hUXByAsGiYU+5k=;
	b=aJm9GOJGUV6IvpmMrdLKCommC3p08VGflCC4MkNGFClEnc/LjPEiK7jixM/vqvRxiVMR
	 NT4BfK5tTQ+0ka2vX4o2QYbjueriS6HnDb8LJHVSSCxRfCcO5uBQFwVyWhL99zkyzo+FP
	 yCiWC2PzVZIKOfhmYJ9wecTylValjHlGZBlmXX1hX+NApqJ/YYjSyFiVgrgEoIKQBuIjD
	 O32oIVfGQPeiHW3wI/ctG/qxvY3o3mQZmORhSZ0vKOW5iG+M85hJiwgLSBdaBZ6h1GMJY
	 QeGTL72YFB7RcvKzqVB2ArfNNUfpDA+DPWkLNQEvTC55FK4qWq2L86uaUPqvp9dgqNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eb0/EKPF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXLItsfF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9D021F00A3A
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eb0/EKPF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXLItsfF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A9D021F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJsnV2734773
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 13:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yl0OmHzVBLs2lSZRX8zFg43M6Hk72hUXByAsGiYU+5k=; b=eb0/EKPFCecM2EGz
	Kbm9O7LvXvQMmyYI8oEYeUOiKOYmpomtGjE4TH+TcHnXRIc5wrbAgafM3o6x2SKv
	QC6UKwHTIgjawan/+tBeidO7Hvr5LNzwoa1pLkvDPGy+1Eg7oR2MnhTAPF62FpyS
	RDPyydHL3jZIxI+sGi+bvmh07F8j6xUBAPNohCzrVq7Pp0ySZO80gLoOQ+TTCPTx
	kaYAHex2PK1vWUcu8LiSL9SnSp+bc9x9L2003y4Ee3rqLK8fCqFpFTKHO0aJZM65
	KK5Hn7t75v4TSQoYD5b94YCCju66xnlM5Ai5thzRT63/RjLddd+ONjJHuPoDKXU5
	h3n9qA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv14wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 13:51:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so127687805ad.2
        for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784209900; x=1784814700; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl0OmHzVBLs2lSZRX8zFg43M6Hk72hUXByAsGiYU+5k=;
        b=MXLItsfFqOaCLO65z/1TmPgnmkZdBEytiYWvzSZd+MyV1spaNahpPkxBquYYe3QE+i
         90FLqvnlkhCYZ871kdcp5YiIhWuEAzM9yNku6nCo2cr1dRIsuHUufxrkOtvVJRyyzmAJ
         iU9apT9pEVncXPldkFSrAiMsq8kbXqKxjudTWW7+zpUvMOkaPWIsKojBmrPZ2BhXo+WI
         ODaOZI4WhFqlURqDWP48xTF9PX7IefYfCj3T+tsUyY4J+A70OSGcKHw1wy+7J/XKL33R
         FT1eKp0LFvoV7gRdYmhiVhwo5Weaz/dYyP+KAmwo1uRSSkaSG12ahvi7aahsf03oLhKB
         y+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784209900; x=1784814700;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yl0OmHzVBLs2lSZRX8zFg43M6Hk72hUXByAsGiYU+5k=;
        b=R/IR83aUOfnd8PboGjlBzDWRO47NDrr8Qn4iCwPHZXG6H/rG3iPT1Ok4V7Wmz9UUVT
         rY1r94oDG6SsjfSmKXMqOH7yl+KCDTpaSJAIh2mbr2L99ZWgNLNSH9Waq0+gwG3FuvOA
         r8NRhk78wJV1PzRBlGmSB0Yp+oK9wfsvPSiIQA7EUVoB883zuekuv/tAKejpQRnhgJDr
         mESFhQxirORzujIrWoN3Z6pP79K3ba2PQjR0mH2nucZuz/KtF71+cXzJsmWoqd4O8q64
         iwmxYgM5y54BF1nqmQC05qo1UKg3Wdq3mtKQCzCqhqtzNcw7LCggSPpk3CcUM1fp64IE
         /w+Q==
X-Gm-Message-State: AOJu0YzJJhQ8uzdjkgQvGwig8tqFzAFtHP5C1YaZMx8YI0KbxpZVsarU
	CsyfpOR1UOJO+J2ykUPpKJuKQV/TawxMWggso6qmrU2AmoloitJ/FsUACU7eraAOUIBBuzeVcTA
	kZCeDBnt7XHNO3q8hxKhouV965pnzhpaum2yhQ2iTJAs5euF7BB1Y6yswOcY/VYV2hgOC55k=
X-Gm-Gg: AfdE7cnTqqvMulGrKb/BpvVsbPlAILjO5XRR4Jr55m77JyAGlxAvq1hxEd+zZuz6zF2
	IINBFflc1NlX1UjNK+aOxwagV2lLnETTq2Uq7FvCSR2vsr9mLxourLUW1izom4xJ+PGxGtGdKa/
	oR9E9uO5AUKglXvGPYc/f1XKD7RFSdomOLHOtpZB9rkiDkprCRFxJsnoibvpUGVePnWlsN6Hqqg
	K4Y6I3uKEMUEpWU9IH8wiS9C225jqVjiIzXE4zicAOjiuZWNUIDOn2gDPc/pH1x8gs2gUBt3huG
	cVr0/FE0WMiftQQqXTbEGTOXLBUZMmj58WOIWdB4YYLSuoEehSt0/gOY1FQEQMMYaQJ/qEzxnNz
	dFgpuESki+DnXWFXCn0rkpavhYJQoLYyv
X-Received: by 2002:a05:6a20:6a1a:b0:3c3:976c:1880 with SMTP id adf61e73a8af0-3c3976c1b4fmr1662114637.64.1784209900439;
        Thu, 16 Jul 2026 06:51:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1a:b0:3c3:976c:1880 with SMTP id adf61e73a8af0-3c3976c1b4fmr1662066637.64.1784209899672;
        Thu, 16 Jul 2026 06:51:39 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd426b36asm10072123c88.2.2026.07.16.06.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 06:51:39 -0700 (PDT)
Message-ID: <d9cd9e05-ee53-44c0-b787-0fbb97bc1e9b@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:21:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP firmware for hawi platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <7cb3f791-1a97-4698-ac7a-7f4e2fbbb826@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <7cb3f791-1a97-4698-ac7a-7f4e2fbbb826@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0MiBTYWx0ZWRfXyj3Mz/3ADPW2
 /tYIuyWy0VDMbcOu+jENA2gAWweMhn5GCTVPG7ilQkJVQNefElhq/CsQgPTzyoJGUwcsULErjte
 cvlVKzrBqDpjGaTLQOkRAnu60W1pWJqg1j122iOKR3NQlzmftTbvZpTK/M5xyjAn0fZjWZg05fG
 fEoSgSPEmWjn6klnQHP+GrVkquZBC+dKaJrw7LDG655aD2Wh6BIHBfx9O9zY/dZDg778mBlVq6+
 CxD74gOpxveYuuMgupVEfy+OGlFbb9VjOCdQqh/p6wVKNGjI52hDeJWDIazddST9quUaBGj52BP
 l+ugD3w5puMFsFfTzvBXAB5ksBHghlEcXTzZF9KlvrNHPltbu80xUCfVjja/lm2J9ErHSE9aySm
 1yZgvVirj52kHdKCHYEuxcoLs4pt1F2RvEWAloZDB3PDNlJMQaCpBDMAvb0tVdDra0BjKD/B1yj
 Y+EmFHxMwAOtRkidlOw==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58e1ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=Y1PIPIzb_Z5m_EPDg9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: YycoSQZrpQKU9cotH5KneEG4vEjsm9o4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0MiBTYWx0ZWRfX/kywlbeuXk8J
 q5iHYpWSf6SLbPzruHW5MlPo8R96CDc0Mgtkt4lcoaPvZV/qOyCL2mYrnwKJ3zJ5FRT7d4CC7VS
 jXtU1lwefqbfrGDZvBfMuRPu4P7LL3s=
X-Proofpoint-ORIG-GUID: YycoSQZrpQKU9cotH5KneEG4vEjsm9o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160142



On 7/16/2026 2:09 PM, Venkata Kota wrote:
> The following changes since commit 
> 85336dd8506867f700b52ba8ae98b84c809eb351:
> 
>    Merge branch 'powervr-2026-07-13' into 'main' (2026-07-15 13:19:44 
> +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dspfw- 
> qli-hawi
> 
> for you to fetch changes up to 9bc90ae3a3f0cd75bfa6dff97bc17ef1463fbf61:
> 
>    qcom: add ADSP firmware for hawi platform (2026-07-16 14:04:32 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: add ADSP firmware for hawi platform
> 
>   WHENCE                 |   7 +++++++
>   qcom/hawi/adsp.mbn     | Bin 0 -> 17086728 bytes
>   qcom/hawi/adsp_dtb.mbn | Bin 0 -> 180040 bytes
>   qcom/hawi/adspr.jsn    |  22 ++++++++++++++++++++++
>   qcom/hawi/adsps.jsn    |  22 ++++++++++++++++++++++
>   qcom/hawi/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>   qcom/hawi/adspuo.jsn   |  22 ++++++++++++++++++++++
>   7 files changed, 102 insertions(+)
>   create mode 100644 qcom/hawi/adsp.mbn
>   create mode 100644 qcom/hawi/adsp_dtb.mbn
>   create mode 100644 qcom/hawi/adspr.jsn
>   create mode 100644 qcom/hawi/adsps.jsn
>   create mode 100644 qcom/hawi/adspua.jsn
>   create mode 100644 qcom/hawi/adspuo.jsn
-- Please do not merge these changes. There is some discussion pending 
on this.
