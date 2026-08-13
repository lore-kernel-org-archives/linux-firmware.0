Return-Path: <SRS0=B8UX=GG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F9C5B572
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 04:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0C001F00A3A; Thu, 13 Aug 2026 04:47:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786596424;
	b=KaJrEU19JAR4XMNpvycUA9GydbnDmg1bN9i9NuE7XaHwdmoLOOJo3pRFsWOgfIPeyHDZ
	 AouPrwSz74kpZ7Y/Lh5lQ/bPrEebLCebg861AFfBhj4tqmIf0+Dx4QDPuhAQDgOr4vXPn
	 stKlFJNV+EEvl7mczqNVhxHRZVu+SQIKvOh52WwY0awcQKFP5wMmo1qaXl3HLAbudsQdF
	 vzq9Uaix6x0mjadW1MHpGrTURaPlyw8jGy5VtE89K3RFa1E9R5tkcdtx/lZwP0E7Sn3Ty
	 tehnJCQVUhFHiFubRnnQNclZCgysrBnlcWx4uKTNfBxJ+aXRB+AG1t8N70bNa0WEEhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786596424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kDUgVfAMRwcg//WYgqZW4X9lJtuIhqnMdNWqyy2Jefw=;
	b=1Lx/tZD3nS7c33xOSky6c3JZy5s2MCRsAwHXODfXJdP54to5oyBVptjhZpfv6v9V7c5O
	 DyUsu86fyFsVRK6AwqjcGPt0ITzFvJJV/fbN2VyM4GjVvhZDSoKP/a8rB6VAPGFyHpBs0
	 4oU5GgJ8ohuUumZBveaLA8hbIhkbPUFTPk0Pw431+XW9Leu+yAcS0PAxvPiziK6Ez8cZA
	 XiaPH92+hlsEG3o33++EpjSIpkni7a05e5EPw3zgXAHfrwMqokJrD+MTAcIkw6siG3U/j
	 zHmwdzhrIkE4SvDAceUfTnfn4eFQn0PB42DSg+ggGzIQIi1neALVAFLkhEYKZGFLCEA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nqgjBjA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2hFu7F6;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F16AA1F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nqgjBjA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2hFu7F6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F16AA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D2KiZS1965558
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 04:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDUgVfAMRwcg//WYgqZW4X9lJtuIhqnMdNWqyy2Jefw=; b=nqgjBjA2UDe1V2d/
	zAGQ5mi6ZI7CuDNe47OmcSIG2LDeZVMT4RA7Z9drOp/V6v12lM4kMZ5aFlGFToXg
	xyenb8ZgB52zIEDozkbxOrq2si58hND7cBQ59f1B2MzamM1KILnawTnKrkhonEAh
	4ZJuVroWr1EPK6nnyyuXP7A56ZVS4SP4mIIdboG2SgIqH/I8coWVY5qg+za05b0u
	JlAc3bGBtMA52RZ++aLsEZ/BOn3XpIXat7nM6mWVcRCyQ0JFVHQiCg+OYSQrI3Wb
	uYYAemlsX6smU4SIz/MkIOeiUalHHE7G5frsEIa2aSXqHLBVUsN3IoKkrrTFj5vJ
	liBAaw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk43kg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 04:47:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee57593baso943664a12.3
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 21:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786596422; x=1787201222; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDUgVfAMRwcg//WYgqZW4X9lJtuIhqnMdNWqyy2Jefw=;
        b=O2hFu7F64SIVMypFuJtiG41H56Xg2UcRzlfbUgCbad/My49QY/YrorP0KIf4Op+rCb
         Whah3VW+TpWMqRpno87snGEF1AmqkDh9jZJZcwGqTrCC1TLlEKJtqLcvrm/Fx7iXy8Ye
         m2z9AmyrT+MNuwR7/SRhX4mSiyt0GDRMCTermiunXbJ2yW4iZ1Whj2/dpK/ilyXs1Z4R
         xHZU2BMHYWU+1BdlqoR4NV7QbUX3qn5ULU3i+ksqhflD/W0kzURjCmY4DiL+wBtXgb2W
         5t622YzeX8td0qXsHhk9fI6rZYZMZa6Q0ZQVZIVRfnTeKFjXyOuoYvLAG5hJoyaOMyPd
         NXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786596422; x=1787201222;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDUgVfAMRwcg//WYgqZW4X9lJtuIhqnMdNWqyy2Jefw=;
        b=At9MBXwGxLVDMJRsoUJvIuRJJJQUeZgOWKZCeeVzv3EH3jEAcWEpUE4KCiJkWPBfcd
         +vUxZB7CC7nOUqGkKbb6vS1wHeWVS2K6J/kLw7atjZQjLO3R0EdDfrmtVq9hl4AYDQEJ
         jfNObvsCuxgwWiXJ9ilV/658rkiBONiJPQXCEGsjtW3RTQA5BZ6GV8gJfi6gy62FMhiF
         DiwfQRZ4jUh70uL+pj1z79ohgeCn5gqgJO2Qx28OzG/dRDSjjZ+z4J0tsDnTfCWcJ0da
         zrRUWPakcMxYYvALf3bkr/wd9bRyteY7Zm/3CPoDYSU7TIVOD2jhgVd4UO+YgkLk3E01
         MwPg==
X-Gm-Message-State: AOJu0YyT3gH+jh31o/Pbl5J4axe47PYM1IloDs62gbnP0Xf+B2qd2xEW
	yfzQX8G1Bui9cZIAFZwazMXF4MAberYagrEL9yUsoPKAByPqMkXYmBZJ6H2xVtfZDGOHbgWr01N
	L/+Zk4PVk9Mky46tRZaE8td4dgVvu6KL1bQOc91CKYvOsTt7BeMlCOGtVcl0AMo0=
X-Gm-Gg: AR+sD10qeIbV/nbGdTkM387UcGlUYVL90S3HzHA8BUDgY/2EoIEfjyQIE0vhlFEv9al
	xqTDyGucDnWa0rzam1pP7vRCVt2yj0L0IhFI3gnpmkm26RZvqoCXAqGdhxbJMr25SqtWKSlOINN
	sgx74WRh4gb5fJkVS5vCpyPbdeCnauyazVeEr9U+jNLh3WoHkTuFkOtzRQIQYZn5dGz+plIUjnN
	J+QyFfCb1LJnDf34+TeOB8KK4PxI4i9vgYcU3qOSQ0o+9jiPLl3X9VhatUJsF1XfPGW8TjAPQhb
	8ugJds/S/i6HX3+LKxFhp4OUhd4o/NWIkkXYF9kHL0V9nVjANi/4L5amSMyyKScYR0tprlRo23e
	fBIccK/97nr6UgZUJCQIlJ1FoNSlc
X-Received: by 2002:a05:6a20:9187:b0:3cb:8280:71f8 with SMTP id adf61e73a8af0-3cc552e3387mr4127329637.18.1786596422158;
        Wed, 12 Aug 2026 21:47:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:9187:b0:3cb:8280:71f8 with SMTP id adf61e73a8af0-3cc552e3387mr4127201637.18.1786596420603;
        Wed, 12 Aug 2026 21:47:00 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0828500sm3156897eec.30.2026.08.12.21.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 21:47:00 -0700 (PDT)
Message-ID: <2c91a37b-77d2-4894-bb38-e6dfcc882f36@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 10:16:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add NSP firmware for nords platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
 <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: geq2rKLCGQYUUb07qR0gM7FcEjaEquqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzMCBTYWx0ZWRfX9K+SwqrGkenB
 a/NRqb6iXoFk+2FZfeZLy5lkntgCPvUCjCdhk7ffGj86y1BrK9Das4ZClxwWazUCivPq8HN/pGC
 dV6oZpNrBr3jDFcey27EgF/0y0ycCtJkXSUYzGdsrGnGFBqdFQRrmOKwKbvfoXKS+v6iI9FwULX
 gDyIzxBxsjcMsmIThDMtRIMTiYRfLbt4oNiQb6WqNyouC0ahe0AMyDzbYC7tYv2ICScJGW0ODcu
 8f1kRYzadtybjBjcyu7G80Wti/LqWBrKHNpGmRw0CV14m6PB9lHwaKcv1U2S8CrNN+DfccFAUbb
 k+XYOUw1JvrT83wbsoMFVBcCUb4BysO/SV1PQ7x4LfjknduJNA5g3099kg0QKVT5AvCXjMnzAQa
 K4xylC5bx/yVjUQwqOP+mrt9QdQ7hZCAOSvcIoNa4L7tjzb0fIX0ltKl2+ePZYIbBuFpdNawd7q
 OeMNyHq/gzDTqrLc7ew==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d4c46 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=1wPT2yl2-mf-tTR9gecA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzMCBTYWx0ZWRfX5khql+x9lRvS
 qdq+X07XLhl2Lxosr6kn9BDQdLmZBpRwCAosyr1uV25b1IUBuaDi+lhc8Zs5XIqDoPTRyC6YeuN
 LMZGypHZTLSHTK1qwm63vjlmmVHLP7M=
X-Proofpoint-ORIG-GUID: geq2rKLCGQYUUb07qR0gM7FcEjaEquqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130030



On 8/12/2026 5:48 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
>> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
>>
>>    Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-nordsnsp
>>
>> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
>>
>>    qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
> 
> Is the firmware for those instances that different? Can we please have a
> single binary for all four CDSP instances?

The firmware is not different. However the signature on these images is 
different with each image having a different SWID. This is a limitation 
coming from TZ at this point. There is an FR93715 on TZ, to be able to 
use single signature for authentication. This is TBD on future targets 
from TZ i believe. Till that time for our QLI meta to load this image on 
available NSPs different copies needs to be there.
> 
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: add NSP firmware for nords platform
>>
>>   WHENCE                   |  13 +++++++++++++
>>   qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
>>   qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
>>   qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
>>   qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes
> 

