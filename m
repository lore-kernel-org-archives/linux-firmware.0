Return-Path: <SRS0=EIsd=ZG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28861C7115B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 13:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE432C4CEF0; Mon, 23 Jun 2025 13:54:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C786C4CEEA
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C786C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N99mNG002957
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RaicFW+iV9t3X+niC1DONutxNXGmm5mcLe0EplD8aKM=; b=H4BTmOJyf75Y4H2j
	vDEcF382NGKJSzSluIIjcHUvgTT1oZTzH4NEdxIOVEB2Qo25dLEQZzLDfIFi7VJU
	Ph4xYFyz9e6glbziAq0PuKcz/THyg6Cs6NDbp0KH5TAEawLfVCpt3WUL95DJEXym
	T9Sb4bfwQ1N7K6R8qRtdKiaReAtbnhTJ52aB3JdoeYJWmtFVOWkELXaK/Kj0+QQy
	WzFshHVfxfKP9JETlrPozaYRSnEhohDsrxfVIycdt6se1CFpI9ZmeOhli4r36sUE
	aOzY3kTrOCKLLlEahfg6WmMk8xQpgOpqRzeSH+uKeulAAoD4G/5l+I8N/H0tMfD8
	52zUmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26329d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:54:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3901ff832so919582185a.3
        for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 06:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686897; x=1751291697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaicFW+iV9t3X+niC1DONutxNXGmm5mcLe0EplD8aKM=;
        b=sHy5nvjcfpD74YXO406LCIkyaMh5bsmDNEwrF/A6DFNvaxNVWQu5RyrGZzYecsAM9H
         QKGaydGD+MqXCe10atoHTrPbow95SYZsm0sAYJZpDAftJB1XEAsHY8syaVjkD7NGNHvi
         CzoI8yGgZFQePLL2sP3LCcWxLVowsX54qHgCl7thZMAKR7t/n67EsRzxaH0CoP/U7etK
         LItwssKQ1DJcKL++rae05xdsMF/pcuS0xGGdOppWTu9GTsL7oD8hs8c3obFqslzyq4pB
         NNaSvr2CxYhjHCXTzIupafZzPm7ldI8Q4kt1SmG9uEckjRANGn3RSQIx2CFkJDcv2ImY
         Wmow==
X-Forwarded-Encrypted: i=1; AJvYcCXkP74OjvQ6RNI/wHSG7Aj6ie0xsGHQwRXyLAUMpLamfT98oI/N7qVJlLrSImqlTLm3FwrfiTSi2INulkMGKw==@kernel.org
X-Gm-Message-State: AOJu0YzGEaa2A15/M7jrNGwDEWI/DY0/85WTwyaEUNApuaP9hN4HcvNX
	BxqQOaMybcLqRhRR9q3zdRjtMJf3QgL9Hc/lxrqEeiHqC4n+8my7kjLotNurmSumGFZeX2L9w0C
	Ko0uFYNhsI1kG1aXPGNzxd08pT3XlWTEpzAY0Fl7D+UmojBaD0KlgDLwfjlIRDbs=
X-Gm-Gg: ASbGncuDj+cpCAQdpyqPS4GUNrHrshvPueE6y2Tmfyw0LWAkGzHhwPJ9QnCL6acHBCZ
	ZihGJqeWGySACbVkv6VjWA9l/aH7Lc/ggAOa8/JwXvuQi6zorc5vRlVkpxrmeVXXwy0Qr9ZRj4j
	ZFUxc2uGVpYskkusu3veO5LmC1/2MHzXQAzHrQZqBvb1wPMwg7Yp2uHvFX3czkchNGRzDrS9Lxk
	mmwORBGl7PS642QnFljgpcrSotGReH5cuYovbTUxheNTT1yrexhsxqg49ajPq8fIk62j+UMQICg
	mn6vTdM7lqpJ1ghirBTxIHwslP6COblzzi/a7wEvR84ofuW4hwI1sL4fNMJThRNKE/eESmBv1Bs
	=
X-Received: by 2002:a05:620a:24c8:b0:7d3:b094:d212 with SMTP id af79cd13be357-7d3f9958360mr2024634585a.51.1750686896782;
        Mon, 23 Jun 2025 06:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqO4aHy3Q4D7pkFAVvyLumFo/k/zjo8LDDDKneipkCzRK/0/nP+h01kaMLptSDs0+pJCRqpA==
X-Received: by 2002:a05:620a:24c8:b0:7d3:b094:d212 with SMTP id af79cd13be357-7d3f9958360mr2024627985a.51.1750686896077;
        Mon, 23 Jun 2025 06:54:56 -0700 (PDT)
Received: from [10.132.167.252] (37-33-208-94.bb.dnainternet.fi. [37.33.208.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bc29csm1418078e87.122.2025.06.23.06.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:54:55 -0700 (PDT)
Message-ID: <6733b4ea-c682-4a0c-b166-d6e9a3bb4e6a@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:54:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Slark Xiao <slark.xiao@gmail.com>, linux-firmware@kernel.org
References: <20250623115444.12870-1-slark.xiao@gmail.com>
 <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
 <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfXw0yFN9PrULpC
 7t4CbMP19MUTXNs0oRDYu8S2Ff1UQFGIcTnXkjVlTijow740lfA8LP8ZfGr6aCYrVL6wEG8/TGl
 Jf7bQieRsXMDdM5ZytsLEoRZQbxJQxtuD/OemSDTqvTfoGK+8vvyQQZOLnl1S2/BSU8F7qxQTK8
 qP7o7osff8qIPIIyszwCNZaEq32NnkXAYmBKkefTit98LYYkLbOADG8vCD2u0I8v9Zel7jni3Db
 oJ7bV4y8FI5ZutrkiQ2iPSwA41yHKb0F2M+UQY8dbq+0anExmh6z4OGIw34l/KxxD3DUG3lZLdK
 lxvNnoOK0Wp5osR+HhSt2+sHDt66AgmCrTGoAcFtuSpaPWNoYSLv+qRevSNDNX1semjXkBblX5L
 QXrCxPYEvmLhLIelsdHa19RZ9srvKwyNT0hbPhk/y57UWNeCPyb2/lx2nrp36UoIRhWavfzY
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68595cb2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=D+sM+DASzikqaCSeXxPSkA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=BeCv1m714w3emQQqDWcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: AY_1XMUFjOGkTB7Ih-DyswG32oGQRw8U
X-Proofpoint-ORIG-GUID: AY_1XMUFjOGkTB7Ih-DyswG32oGQRw8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230082

On 23/06/2025 16:50, Josh Boyer wrote:
> On Mon, Jun 23, 2025 at 9:42 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
>>> For MHI modems, it defines an edl firmware in kernel drivers/bus/
>>> mhi/host/pci_generic.c file. According to the requirement of MHI
>>> driver maintainer, we shall commit this firmware before commiting
>>> kernel driver support.
>>> Since different vendor use different firmwares, so we add a
>>> vendor sub-folder under qcom/sdx61.
>>>
>>> Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
>>> ---
>>>   WHENCE                                    |   7 +++++++
>>>   qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 bytes
>>>   2 files changed, 7 insertions(+)
>>>   create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
>>>
>>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm sorry, but I have no indication the submitter has the authority to
> submit this firmware.  It's from a gmail address.  Is your Ack
> implying Qualcomm is agreeing to submit this firmware?

No, I can not validate the submitter too. It's more about the filename 
hierarchy. I'm sorry for the confusion.

-- 
With best wishes
Dmitry
