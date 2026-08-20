Return-Path: <SRS0=ZQM6=GN=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A6C5DF87
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Aug 2026 13:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEE1B1F00A3A; Thu, 20 Aug 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787231244;
	b=0ChIUdJxuHNVGBRAy/tkQ9cT9tEJDpucvRnP03Xmq1avIROa7tWVYhKDvW0tNhJLKcdo
	 h+yJzaU28lkWrWPqpXYQYuDThjzlHJXBIaIq/i6LPFmcV8rzutAh2AiSe7nI/PC4gf15H
	 +SUYjZVB+7waUnGXUkOxxRGDaOfV77YBvJHRBc6Rrs9lAcHRXu4Jydk/bUgctbJsCeyRS
	 jB5YujbOgaRfsInKhF89Qt1aaq4m7Zpk4j5ytgJrcUOZGhOXsN3ZnXT4RSKNBSYXHfGUr
	 e+Vj9EBAmfg1lNrsWq6kBjgc9Q11ln5MUVjneHKufzxLSuzD0Dm2XZgvvHgVL6SYzZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787231244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6DIZEcNHWBcVa1RvXxw1ykZnz8xRIreXiUUpARKZ6o4=;
	b=G4oryFBdATNwpuYNa96+/6glE5TbXdVjkQcgUtm/pc/4NSv4cQYWc92VW9vF/7wwvkK6
	 BeK5ZEfcqW1Wt/AaY5NPCM2K7bHDsINJ1tYJ1sVshZoxHjtJdOBWfOJZhfnxfXVxNpA8I
	 LK16GXxw3khcJ3oXRQQhH8ZB5IIR2USsvOvy2dwt/K08z79UcdtzqPFa0YgRll7NTMRD0
	 ASkAMxPsP/iLxRLpNJhGylhuFtpDMGZv5ksAdInK9IcbRt3eGOR1WRkBpMHzfBrKRYfAD
	 t7xNNwBcb/J1OMJhFEMuuVJO5+oN5aGSFxXWiVqpGgQC1tf/hrCElRa58SsEVb/gRrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZhIDVq6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfzSICZ5;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C7AB1F000E9
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZhIDVq6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfzSICZ5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2C7AB1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KCvH7X2161339
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DIZEcNHWBcVa1RvXxw1ykZnz8xRIreXiUUpARKZ6o4=; b=MZhIDVq6r+subWtJ
	YaNLCb7hdyuFe4Gxu88KW4XicdAvIgA6ru2MLXOuexkpXB/z6wNlIaEW2eKVVZr/
	rggd2CnYJNRZT4KW6nz+Oj2Q191GfLu7c7idEGOWuE6JaRZZwkWuVfXE+Y2d8zjI
	onSA6b7L7XehAA+RDAmZ3GD8B7SHI5Ef7yuISnRTfSYsD+lngquTWslESPUXF9J3
	pz2ZBzOZE07KAVfw4CgYgg33YpbY/0UzwQyaXhD7Uc1dAi6GFdi0Rz6sVhhXcGJX
	LgaQ1LS5k4kUvkmHEDNNo53jTSZAjoRljVw1eY/X6uFxVF2LgastxhJNI2Ra1+b5
	fgbdcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7sceu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 13:07:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so36770015ad.2
        for <linux-firmware@kernel.org>; Thu, 20 Aug 2026 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231243; x=1787836043; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DIZEcNHWBcVa1RvXxw1ykZnz8xRIreXiUUpARKZ6o4=;
        b=kfzSICZ5HnwaGIbc1XSNuTTON079qJ9AQkmcdqhOYVABYxtQ1NCtQ0Gsz8WXWFDNkB
         qRpYQ8iXJKGiKoZrwcZg3fWGZVbIXQx3K8aSb4qksmm/1pbzBVZIAWSpQ5/YHqtpGAlB
         1g+mjLDG1BSvpWrXuxIQL4qNqSKRx82VHc9nZnc83eEXQnBGSU4XMsPdCbo+E89SPnaW
         F6dWm2+ZnldcJ390P8OIlszl+X6jCLHTGWd4/Z5S6vjaC66FXM9zqWWZ52BqT5Dhweys
         icymWpy02qJ8ClyTyPp3MhGVOdzvNjMoytC0XXWfK4lBmoSmwkZqloFsd69pdkoKoQog
         akXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231243; x=1787836043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DIZEcNHWBcVa1RvXxw1ykZnz8xRIreXiUUpARKZ6o4=;
        b=eQ+XVqkxiQn8jQ+OtwIv+t1a7LGsukcQRWtJVw+FWJwbwRr3jo+4qsn6LKvPEu39ZP
         fw3LFvN632b432wSCOpoarkT0vUgKZU5FMAu/MJi/sgKaQRN8d2wg6P4C4Ewx7F4h1tB
         nuxj3dQNXIgBqFaGlCjrwTqSkRJBSMr98kA8Ht1OJ81wsDl+sesRNStm1MaMQ4hIytjz
         KrSjwVzrSiJyHZDbGIrRW8VppADKviE2QJFZA769p/kEtS5yiP7GT2GnTKAjAnb2FAk8
         3+6gnn6wOIuqQmMFO4c7Y6U02IZOpsHVDEd3DaRvvrSBuXLhUArL6uuVQegdBiZP0A0f
         ZhRw==
X-Gm-Message-State: AFuF++mDJ3z/dlHu5w4bUQwTte6Y2mDJ+clsu6RW6CoUUKSxVt5j2yxw
	iIPWL+5/7MDVGU0ym/WDprzDZKdSI6MNR7+H+2e2K/ybGPRnh94n3aC+8XtpsGbVN6X48AXWUvy
	BuaxG1905hh22Y9K/Hg12KBgjGLRI8+HvYBt9nH7dOmQpxrRZScTDqltLszfDQ+s=
X-Gm-Gg: AR+sD10zyLy1YoBJtBarIPybIqeAXEfqz80hukNpJTlF6flzwIRofHveZl/hKSjbCuM
	3hNkKGZntwU9JxcZlXLQ4W/pD0mCRv8GvTmnuadMmDTEfkABqzM3WrAOJPMymWTitO0NeObkdpT
	zr1JNCxauNLvDthjOtjjjFewWIVBugDWff1Yash3rlqnUaTKx1WeGP4XIx+KKNwrwyXqzzdo0Y4
	tudvgyl/Z4JnMkAUCnS7b9vj1B9PrIxjRxrBvga16tw3EQNSuKDUjQDyq2wo8XDL7zrPAKCjxmU
	MTebZmqpiV5oQz6/b7cdc3YqSXPmDzyDAhKrZWW591IqTpYEAA6hj/XkWwVkzpqmaHf2dI7Zjyy
	55Yd0b83ieYKZIElA3HJjz83edF09
X-Received: by 2002:a17:90b:2b8e:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-39580f03c97mr24513044a91.7.1787231242680;
        Thu, 20 Aug 2026 06:07:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8e:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-39580f03c97mr24512906a91.7.1787231242159;
        Thu, 20 Aug 2026 06:07:22 -0700 (PDT)
Received: from [10.216.0.102] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm6550509a91.1.2026.08.20.06.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:07:21 -0700 (PDT)
Message-ID: <bc7688b9-4568-4040-9d86-56ac3ea7c655@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:37:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add NSP firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <069ac343-254c-4ded-948b-9a78ad665ac2@oss.qualcomm.com>
 <4mc4lmxzz2kpwtmxja5zsgn32kmudut6kod3pfqvtesqwgf37v@jfnozyogszve>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <4mc4lmxzz2kpwtmxja5zsgn32kmudut6kod3pfqvtesqwgf37v@jfnozyogszve>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfXx5yc1niwG6L8
 yl6eQLUTGqQ9Xhc1CKA8KCTZpMMUjuIFyN3FbvOIC0nyKzhyJEMY6k+caz8ypboSp17CL4oQNEm
 9xH6qBB5U7LKWQgJxpbnzHldSPXD7beyNnPGrU2TC2v+pV+/cXM1kWBjeQTnv6x5X3R+7hKq0RP
 iuL7huiIvI01TUxpM0/l33hT/Fq2Mxzs4yxc0sRXlRRPRkMPnzG/GTReFIi4w5gkU+P6Df2fIgF
 J6DdZaHb0ewDGvlq3QvQ3JFeBTD2nnMvw2OM9+OtGL3K/BP1aSZ4sYqqU6HeN8GHis5ouWpYaxV
 RXw0haOCkO2MFj65oJjOp/xnfI0RUr3EwHyXwlMbbHxPFPIY4+QdygYQjRt0/XuaikN1TWvWamK
 wygyOmIP4M/nzQke8c4zzpARwIaq7Z24RbaawXU44/EG69fvBEAc26i7jousY3zxfHU+lrY5daO
 j3l1MWxMllPPtZyJOnQ==
X-Proofpoint-ORIG-GUID: zDCGpDKh2XbLT9V2QwVDTJGPHJ-MUzTT
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86fc0b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=QPXYCgwQSX8cQn-ErFIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5OCBTYWx0ZWRfXxSnULBCsRW6a
 r3aCfvIiJH4M0vuFL/GABDRgEgvbGXmzAmNqDJEGzZY2duExqODYfB/G9B9OgasILpcRsdXk9AT
 kz7HiE1ofexKHeOWxBEPaVT+hw3Fvao=
X-Proofpoint-GUID: zDCGpDKh2XbLT9V2QwVDTJGPHJ-MUzTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200098



On 8/19/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 19, 2026 at 02:38:08PM +0530, Venkata Kota wrote:
>> The following changes since commit 0a6871b19abf5d6e024b5d208b101ae53e7fa0de:
>>
>>    Merge branch 'robot/pr-0-1787066669' into 'main' (2026-08-18 15:29:47
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> qli-dspfw-nord
>>
>> for you to fetch changes up to 391e1aa5d6c425f6790df7a7266243b08d4fa177:
>>
>>    qcom: add NSP firmware for nord platform (2026-08-19 14:33:54 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: add NSP firmware for nord platform
> 
> Is it now common to all 4 NSPs?
yes
> 
>>
>>   WHENCE                 |   6 ++++++
>>   qcom/nord/cdsp.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nord/cdsp_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nord/cdspr.jsn    |  22 ++++++++++++++++++++++
>>   4 files changed, 28 insertions(+)
>>   create mode 100644 qcom/nord/cdsp.mbn
>>   create mode 100644 qcom/nord/cdsp_dtb.mbn
>>   create mode 100644 qcom/nord/cdspr.jsn
> 

