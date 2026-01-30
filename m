Return-Path: <SRS0=rZC2=AD=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD459E6BF37
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Jan 2026 20:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A501AC19425; Fri, 30 Jan 2026 20:01:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16D28C19421
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16D28C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJjJPe2965124
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=; b=bDrwHOQZYvNzAECP
	RAruACmted87t9FtA4Z3d82HJ2nKgE+X84dkK2fQNVyiSTsvrVRbVGQIbSqYzXLa
	z+7RSj3OJsdh/do/aiM6RMVh0BLcSKgHolYY2eK445CCx2jFHUl4ULb0KhmBiPRY
	BjhTZyuTbbEXgg0J5TsD8HoJw5uXml211zxyGSc6JZyZikicX2Wwd2MJZMbhaG04
	88EG1uIKUJ5jFVXRJkbOP8mIlk41YcEhjM294+Uu5Zsi9i4O8j1cuNTzBPsSLXT5
	eB/4LjIVM4FW4ukmmQGiH47B1iCtCrwRzQbxsp659Zt2P2AuNthFIgFG1iicOBp+
	x6SMlQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1332g1fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 20:01:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b94abc09dso3726183c88.1
        for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 12:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769803262; x=1770408062; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=as2KQjwkXQ8dKA3PFD2J4YULvFeiXqOiZvZ73xGuI/QlZeDXkbHU4T27UbCyCioeCa
         QnSzqGJt8BlnTIrwrhK8SNcVfl350cSDQ+m99ZT8QgdY5bWAMkCXlzEZrCTByvsCCG5x
         DtNz+rR70PxPnUJY45fVmItHf+81NCJdkRc80Ec9XLJsVOHvqoWx6olWfBDoHybFAzd1
         Ll35gziCSevd2p1vXglgiISSBCnbmaXbXVC7Z6vQS6FH3WtD9NV8upAzm5aJvh3FBi4a
         IsFdWEIVU3jveyb5pGpoTuIvvNOv1r7LCPis4Y6l7UpGpjU92jGoRFkNqoMxUabZb/np
         E0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803262; x=1770408062;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz/hsnbD2K7FC+wSCS9iQfBJ4f/RO7qpudJGts6770M=;
        b=ADQ5v4YeJ3fqDwiuht7vysHIzGd1pJRf22tFf2zH1ybcJ06vDqU7x6tX9BaVLfRkWF
         G7+a/QxYoBN8tH+zYTTUPq7rJO65BZJvCCmk5EoBFwSMMWsOQc7QEbqs+9zZG/jVanHx
         2oR3gV4ioWE4KfByxnHcKk1iFZyuOvkjVgA7/XMokUOOUr6F5fueOi6/lyPfo+ZGU7kF
         Wbw+/h+S2W4jC69yTjbisUwHMM2qVkIs+R/mXso7YLm97Jz6MGgqUAc8f9OslpRtquFr
         +JPo3ZH7hXUYWk9ggK2RKuErieVJvImxj8AeJByJBkAqQ1resW/OuVWwd8HEHyTK5+Rk
         tz1A==
X-Gm-Message-State: AOJu0YxK9/d8V91jaH8nIzIcB2NekkofMxzwJuVZoeJg46ZpbAQsRTwQ
	w1LmEIFZ8NJ+Vn0Ab0H1Ubw0Gpsj4oF+ySWwRRgluTrVc+4ULd80XoOPR7LsguWv/32gMYABTBD
	qZyS2kQ8Su5Rz6k6hluGvrRshHJcTrukkQ6k3/DwcAeQ7tG5E/+AINSrXeGw/aeU=
X-Gm-Gg: AZuq6aID4xrlvQK9Npdx/2eVc6+yp0v4iz5+lXH6GkFugzcBWj6mcPhCLZWENWKQ9np
	VjVfXei8Z8UY6z2M3cKpzHV4CRYuJTMg1unxzYo1fYKS0u090kuNRTblMp9AaGiEQdxkhQ2Aap8
	F+gVxGUnGupcUU4TtDrjwqu19JiEberEctTpIsYT8grn4t7lUeObiAhUNAFSh1DUV0iwuZ/+INc
	S3bN1Fb7Nc6/ZAYUcwVZI4j8bamRzSzba1bO6F1VK0MfWexAYJaLU0iVwW0Zsc7I/NKYBN/vgBA
	7psQzy7ggKS1JS5TDh2XhvSv9dx7/8IZ6Nfq7Yq4kieMFbZZJJq+8oWgaqTTu2XxKVOOC7ri9oB
	S10kzPwvDY2eegAtAIBav2end6CloJjktArrX8junCo6VIoTm8CuE+hs4I4G0k+GHqUIlUSFfKo
	Ot
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983162c88.25.1769803262318;
        Fri, 30 Jan 2026 12:01:02 -0800 (PST)
X-Received: by 2002:a05:7022:6082:b0:119:e56c:18b1 with SMTP id a92af1059eb24-125c1000e70mr1983143c88.25.1769803261707;
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm11546699c88.16.2026.01.30.12.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:01:01 -0800 (PST)
Message-ID: <7a763739-8acb-4bc2-92e5-3ff8a3fa2bf6@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:00:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
 <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V8dwEOni c=1 sm=1 tr=0 ts=697d0dff cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RcOUi4Ga9jvAjSuFGeUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: yhvI89f6oCpPrWcgPizT2EhtHt-_u9yT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2NCBTYWx0ZWRfXyCEFWILlsP0Q
 tIkMa4tTvTDoMiXX4SGM5q4ZUDqJ3AUvj2BGS6K3IaLERk17Ykg47EECA52QEI87y5WQn94uuUx
 Q2vR368SiHweGZpPhnv1ing2pmiN2mxeddXNSUHlF20u+2TDJLosH2TcNP8iu0cr4m5dzbQdZzc
 4yvB67gG+djRiY4bh6GjcG9FA3efC5ZFUBGphpP0sg3OGBPGB1Tt6Kw8rQVCtFhaHXpy9+Bz09/
 OCKGR3DVG4vjERQIxlqyXfEAhWsjjsJVsepvDvY9B5/d+jhaahUDgGKS5a3n+peKpIFBmYAlmV8
 ruxobU+OQcUsIqgobQU9BEcIMLka72SJo5WWt4lqd/pReJ8vgGdXlYH2gKV7fDixxiy71f2PsfO
 5bR7jJMXy9ziOYwcy2XtXVTr/eoFar7ynMu5zXHSKAO4cECqNIFm2j6BPN7ZeBNR7q4m1xxXgz2
 46526mMQp2v0kkcQx+A==
X-Proofpoint-GUID: yhvI89f6oCpPrWcgPizT2EhtHt-_u9yT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300164

On 1/27/2026 10:36 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k.
>>
>> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
> 
> Don't we need the variant for this one? Otherwise it's too easy to clash
> with another unprogrammed board.
> 
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
>>
>> For ath12k update firmware for QCN9274/hw2.0.
>>
>> Please let me know if there are any problems.
>>
>> Thanks,
>> /jeff

Please drop this PR.

We've spun a new board file that addresses your concern and I will be issuing
a new PR.

/jeff
