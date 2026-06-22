Return-Path: <SRS0=63HA=ES=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA603CDB46F
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 09:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A99641F00A3E; Mon, 22 Jun 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782121769;
	b=fMxg51FvXD8+Oe3fDN7WFzALEZKizcbkGRl58knubo4/oHItggApgddUkpSX/84IF8qm
	 8186FNE9kCX985l9w7ypVMXN0JlxMUcmYTF+8QQEl0shT4Kio3CyG+GVEus6oZtqWfxAK
	 bWNPivjsb4JFEJptHhD7mvc6Nr6lYYChf3Sx3N0YbS99s3Tow0n2vtaWFvAURp8Hf5ADQ
	 2MMuv7GcMWjQGoJljtPB2d47wmCVyKl2t1xKF/skBzOgayfqqOeywUBw56Lo611TLNinn
	 uyWCyF/SCdkdu35VJtuQ4uUQ4KGz594rZITY9HPQSO+NYk6JBQYW+DWk+3UXRLFSB/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782121769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:List-Id:Cc:References:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2u50B5OPMLp1FkjdI0N8XWzaPJ1Pl5c++FW/JpL11fY=;
	b=n2SDQ3Vl6Jz4a/PhwcCBQM1/4kGdcYkx209yvR9BlomgobngiGffTPmlqOtu93gDOFK0
	 jDnBdcympQ2LgZOvTkgsVGHvaGETgO/NQL+Q4Gqcx2AV8qnCWRuWYUI/Qimj4c2/vbThf
	 SKTN8BEjLbAXGlDTjClYkBBQoXv4vbYkvHe/bAwhAHLT5CbByRSAvfoP7vUoL1FpurE5d
	 0pJ7D2JtPyBQQSwEYpIoJ0JKLbBazE1SIuIlL1eferpaB6IUjYVW83En/AmqaaYswAyYy
	 4l/xencixqvqAuWRGLtJr+qPHQyL/UCipIY3zFILtJ0w2PLVzxBGvDxCJc+e/G4+wgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsJYE0aA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEen1x8Y;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 128331F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsJYE0aA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEen1x8Y
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 128331F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5932q1275291
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2u50B5OPMLp1FkjdI0N8XWzaPJ1Pl5c++FW/JpL11fY=; b=MsJYE0aAj4v6WsSW
	YsDJ187vHBCnaOnMYB331xhohCuFCX+fzKdnpZFIadBc9ud3dKENxy2lAmszlsNo
	QKtEMjybpDvksuQH2aOfbpNmW2PqyD1RLD5eZOsvkOqv/p7wEU8K5MnE+z94HC97
	aX5qsXBjWvyzYbacEoh5hK7Lugale1MWL7epLgUZ+mYuS8S0MGnTnR9Hps6pm6Ll
	0RRPQngDJVTVzTu1gNc8S7N3O3tZ4dUCH1lIXJ4WWho3UMW/Qr0k8rmP+Ri5GqXB
	YXdkXSZ2q1466BdaFYr1ofWIlxMMokNCYgL0wFSG7ZF3IiURmUrAI+7og/ORjNK7
	31tQIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32wye7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:49:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842446a3851so2159834b3a.0
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782121767; x=1782726567; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2u50B5OPMLp1FkjdI0N8XWzaPJ1Pl5c++FW/JpL11fY=;
        b=TEen1x8YiCJuf9pns83OfdL937gmHN0CiLqkQ3V/goPTwyw7UJGJOKeYW7CM6gEcEi
         30K59Kylxv5EnSrk5/nGDN37AxnsZFPAD5KJds5BOxdwamralbfEwkVxrMN+me02WvUY
         VZxMmNpq/Qn2iRmsGu8Z9DjY1pn3ZPsX38mHNBQvJYIZ2E/m+/m5maYi83S8pOgGo43e
         joCzsXHAgT+qKZZLmZECWRTzKyJBa7cyyCsDUc3qjgHLPHF++U1XAIyWkKb9FFJ7Y/Xz
         oKlw++8eADosNDE/3UTOLxfPq9uZ5vs0vmLoWIg+K3hUQG4AcFWuEOgLbsChGODeR+Tu
         aRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121767; x=1782726567;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u50B5OPMLp1FkjdI0N8XWzaPJ1Pl5c++FW/JpL11fY=;
        b=hsCZ3GffGQcUmHZecwy+DviOoBbfRZH4hgeWuakplhUlFsepN7tqvXoQ9xa8JMwxPy
         jZn1Rr6pigUFnv32G8yczu71q+lY0geHSl6nu0f0iNnXBhvjZNiqqVzbmILQIFga0HI9
         kqbHvNUJeVUrDIkXETvendcGaIobpF58ALtAWYaKDgs+whz0lfYyNizm921Vl+MyP/w5
         fWkXRkI9Q0s7mHBtAITOJUA41272JfLJ5u0VDLCy24SOUVw8LxWUcVCODaqskFi3JW50
         Wt/CZkHucQg0D9nDwn5FrxyGsbpfAZiqKwufjF2WiB0fU00/IN8gaTTCbbSXS5+ySyL8
         hrpw==
X-Gm-Message-State: AOJu0YzBT+G2jP/qBe6iRLG3bYaqkp4KXLUnL0ZjcKlb75P0+bYTR0UJ
	fo5cmjEWcugNsrknYTv3xkGSLvrtng9tXk6NygSvA+667grqJ4V+ohlB++lNd3y2HGo7VaQxktj
	c7bjqaC3jDFTXgU3e1BVScXnSqrjdSLJyBC9MdF1NPXl8fsgOyFavQp+Oo1N0dTk=
X-Gm-Gg: AfdE7cnKocavLfpB50Tc+wRxXZzmYn67OzrjKEC0dc2Agws5jDSNnH5WS8tsHNeav32
	2311jHMYFRAYsUDaWo/dyWv2kTNWsdUaiT2lRb9Ix0IAfp+vy3uTqhVbShjkHdd1Yyo3A4ibbws
	ap6tSXgFfvqH+hPkT7qtzew/D2WrzabOj/6irzT42miCpL+zxpdJjIlEa9ZCOa7gHzA34R7q2VE
	Kiiy40c+Q9awDRmoGOJAgLP3aGxTjPyX/hcQXMxqUYbdfmdq8E1DNZR2TLX7LFQcnewfBCkSS3m
	yLtPDcev1n1xnFuVaMrs6h94Q3B5X2n1lKJIMiNNIvcHq/vwvyoQM8U9RuN3G9GG8BoEdx6w/AC
	ag4A+DpGpuYEdyX2l7Qu3XKY4Dbqu2O5NCkYWJPVt
X-Received: by 2002:a05:6a00:4fc7:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-845507be9e7mr14482732b3a.15.1782121767534;
        Mon, 22 Jun 2026 02:49:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc7:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-845507be9e7mr14482697b3a.15.1782121767002;
        Mon, 22 Jun 2026 02:49:27 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d89bf2sm6930897b3a.16.2026.06.22.02.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:49:26 -0700 (PDT)
Message-ID: <9657ea29-630b-4cc0-9b27-5c026b2a6b15@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:19:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add LPAICP firmware for shikra platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
 <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
 <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xefLa1FzI96Drv-Ehz7KMooxyaGfnHQy
X-Proofpoint-ORIG-GUID: xefLa1FzI96Drv-Ehz7KMooxyaGfnHQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfXyfUhf7ue3eM2
 ODBBXgTWMeAyqIJG1GNF62e6nkRE3bzc/cDKG2h5N4Y4y2N2ZKSKXVO0eXJQ613eWNmP1Z4sZ2t
 ZQDB7RPULa65TQQ+Hv9biEm+Q8TsjRQ=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a390528 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=c-ZnffO9Cy7RO1lOPxMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfX/pqbe26turcT
 i0cpV/LduD/vFHjuc5UY1L1PhDVb4yLYY3D3+5UDMUZEfh2E14fGaUprpFgrx66kAD6dNPiuobd
 gYXPqifdKGSvnD32sGAQ2WBUUKMh2yNTMo2WMa47VpLoHeb5CJ43wKvJ7UntX9oV1wB49LXxjBn
 GfKYsQTp+a8OinOMWydG1qoXJwsf68jsqtpNiogk5x+qCk2mAbndvdZXvRG1dWgTnP+e2uL9I5q
 SvumPEkSeo9Nry8Ohx9Y9JiXx+IyVTjsMM6JSm+hZQtLjW22Ee8QMNlDbwttjANGe0LUqC3Bgcj
 lPDyxFcStNkHD305iOr3XRQmZQ3jXKIbdmJZj/14lgKlK+rJASVGRRhohgrwZEzlkMdtZDbAZ5z
 /22qTsgvNFy5X4HI2/p+CpeQLSxQ/Y5CFiGmL35X9VMhPArcXXp2tesxGoO4DAfsPtbhkM4MIwh
 Wf8RVG1cMgQ1MY00O1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220096



On 6/22/2026 3:14 PM, Venkata Kota wrote:
> 
> 
> On 6/22/2026 2:03 PM, Dmitry Baryshkov wrote:
>> On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
>>> The following changes since commit 
>>> e7eb98afc667913acc533ab910c608bee7d08f25:
>>>
>>>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
>>> +0000)
>>
>> This is the same and old commit.
>>
>>> The source branch is 36 commits behind the target branch
>>
>> And GL refuses to rebase it because of the conflicts.
>>
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> riscvfw-qli-shikra
>>>
>>> for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
>>>
>>>    qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 
>>> +0530)
>>
> There is no forking done here. The process is just the same for all the 
> other changes that we have pushed.
> I attempted to push on gitlab directly where i ran into the following 
> error:
> remote: GitLab: You are not allowed to push code to protected branches 
> on this project. This is the exact message here
> To https://gitlab.com/vkasinat/linux-firmware.git
> ! [remote rejected]   main -> main (pre-receive hook declined)
> error: failed to push some refs to 'https://gitlab.com/vkasinat/linux- 
> firmware.git'
Added Saddam as well for Information

