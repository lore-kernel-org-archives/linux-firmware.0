Return-Path: <SRS0=ytd+=55=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEF0CFA47A
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 06:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78275C4CEF1; Fri, 21 Nov 2025 06:50:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FAE7C116D0
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 06:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FAE7C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKMKAJx1843399
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 06:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Fh9YDZbZHVohPxdia1qxrG2y4KBzufzzZnmOHoDd/o=; b=SRt+kNm9a7294W0M
	ddPPbSgvQc2pVIJqCbUUBRAt2KiMyDFJwr0qRuUfdI23mVGXwEWobtATfeQ1AefN
	0ZPBXkKMX+9vAaUiOJc8X3FuDZsUhnCywvgfMkNPrrb8N9/iK7AclzE15Rc9RS6K
	okDq6ET9H0aBwieQxIbdBUdHmsJvMMOMMUyY4Iw84xcGi4Yr1gNbEg5AUOQfsCZ+
	bUVY6ZuUCTQpavGRiw3a9ZgfCVaUJLl2E9vgKLva6c+guYyDarcpBEf/Pb6H2H/a
	PzvY9GCkhSQ/+IMQRtNhNI/lTYIwJtEc2YUOKnrRHgwhCnaqiAi3BaRadBpo+nxA
	8B1XYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajbpns6sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 06:50:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b227a71fc6so47127585a.0
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 22:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763707815; x=1764312615; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Fh9YDZbZHVohPxdia1qxrG2y4KBzufzzZnmOHoDd/o=;
        b=eOXolutZtP9dnNYjwQvIkqj5CeOSaH3+/zFsgG8YGRlslAtDgJYjX/2vzgxDxJZHa7
         gsUtG1smOCWSBrjKDnuYsiUQKwZNKJEqFCWUaVutCCwoQrV5hucSSLa7poVwin8/Z/Za
         +HrxcojiehPilFolW520SXJ+bFb9d3DsBA2juP12fV16UTzhS+Ou9lgfeolTamqllhVN
         lfPqDDXV612gnE7hK/Ts/35TttVGpQW3tD+wgBlip6GrTowMNqOGKNXdpsTBKHPFnpV/
         IORpstUCZZhUxeCscwh3CBAK/o6g4qnFhcse9E3ZAvqEx09w14SgshhCcD2nzQ6h/zP6
         H2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763707815; x=1764312615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fh9YDZbZHVohPxdia1qxrG2y4KBzufzzZnmOHoDd/o=;
        b=RS6+ovbpCseGcGWnPBD0ihN9Oi/j1kHVYA9VmpyO+UG7fE32aVk7a/rBIp6VATEusa
         1yo/jvJz/7kqz76Aerj5Jc/hvDCJHypjz46GMW7uC5UdtfDD6N/193HxLwgVLn9F8ZQy
         qtRNb1vq7aM6/ebn0bdGNThygGsbYrF5vASXwprjr7zS2TFRpVXaUqZv2L53kmT71dz4
         JdOjAg+kweYjLtDQR/JqO898S/PD7bfAMSe6l8fXEo2cXtRCS+Oga5q/puvQOOiThwKQ
         IFRwLw9eAWmiC1d4lhiAOHHUPQgQwCFAAlTTRcz8CND7Dy3yb1DcUODsuCB/Gifoz4Ku
         hytw==
X-Gm-Message-State: AOJu0YyyeHEmi0Mk+2Wcaq3vPE8Pp8HSpfX4+7EgcsgEsDCpLyUYU1FI
	pVAdzXgFhOx6/DdbZLe9smPfPCyZzU8zO77No76Zv2rfoU+K3voEhPP/wFN6DkLbHKYNy5m8xWN
	NNVfj54VerfqZxrN1rBPHH8KsonRX2ecaBekT9kTjzG9TCxNi8Rvw4jwWxSomjn0LYqKZvdw=
X-Gm-Gg: ASbGnctIyod7FNjcvbvKQrRrIFQ9Fv25NpJAWCo59gmKf0Lla6iwfkb36mXnrT0DjSD
	05N3WC7/vFTyqgyPCtsQsOzxnF4Gf19GQQwhf5+HrKhPXXpid82kmQ5rXlCh5H+TnhYY2UPsdIP
	p6p/4R6Pyg/+nO+nUZ4K73DymGafc7C0of1JgwvyO9/giFP837WnNxj4uVCXF6yRduocqFs8Yfh
	RS0xPz/Ct/t5kg89xbm6675OKKLIRCC3Iv+xjE2qcVh86ScDDhXzIQPduIymEWUn411byljC8kM
	qPJoN/rvpXSBlKbNkEK0HVGxdPs6TmJiYv7LVKD9NHya+AJAcN3VvTdITqsE8vDVY5oPtXNBL8k
	5JvPEcxQPPwknVCV/meBkGeXiFpoL/fqK1qQw5bjsxVLkDsiBP3HKkz10imdaHi9TpeKaLQ==
X-Received: by 2002:a05:6214:1d0a:b0:880:55fc:c984 with SMTP id 6a1803df08f44-8847c53b61cmr12372836d6.5.1763707815295;
        Thu, 20 Nov 2025 22:50:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU3J1Sk23Hidd1nvXdojQts+30WwBJxYP3FbhCsR/UKJorf1p6lO1LAOqYNO+XNfqEPVejlw==
X-Received: by 2002:a05:6214:1d0a:b0:880:55fc:c984 with SMTP id 6a1803df08f44-8847c53b61cmr12372766d6.5.1763707814880;
        Thu, 20 Nov 2025 22:50:14 -0800 (PST)
Received: from [10.111.165.185] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5ba2bfsm33139766d6.57.2025.11.20.22.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 22:50:14 -0800 (PST)
Message-ID: <73738c07-eca2-4065-8e3c-3bb68e8f291a@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 14:50:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
References: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
 <ylctfzbgxpnbitgxk2mwpw6aptdzyedscbvwm4dzsew2sskdal@tlyyv5bulpzi>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <ylctfzbgxpnbitgxk2mwpw6aptdzyedscbvwm4dzsew2sskdal@tlyyv5bulpzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=69200ba8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=R4vYNCtyh0xaBPIV8HcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: l-MLHcnJzoIX_vrzJhTTISh3I2NU7zg6
X-Proofpoint-GUID: l-MLHcnJzoIX_vrzJhTTISh3I2NU7zg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA1MCBTYWx0ZWRfX2gUocMnSg81M
 m7leEM80M1/Q5XOip0GlQqqBy1iwwucucTBCKaqAx3fiyYgjR+LthcRqZ4adHyQIZH8qJ/rpbGK
 huWVP/Qbi1CfZn7ObJ+VJFdpflO3NgKGZ6LHDK6BrhkgQu/9Q9rAYMwY/qlCQZrhND3e3UlKjt7
 TxAQhbJJx2TlEDowS7pYtIj8QHFI2Qx1E88jIzudubsYNVXHzFEOf+3P0M1Ek8yGukGsRWL1pVZ
 sKfSdlYMwSCihY0jERD7r9npK2LL+tQwA+7vT9LkTCTWavq+5NQ5vhWMCZ9KMGG8xp5aZgfi9DE
 eeGEZ2HTGXQjEqLU5vQKrrc+6xh3Lx7JjnJ40M3HSECYxlyRRQKlLq+iNfyKsUcDplE457UJiAB
 uiErXvvIJpWwEbStGCShb0JFE8cBfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210050

Hi Dmitry,

Thanks for your feedback.

On 11/21/2025 6:29 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 20, 2025 at 12:19:21PM +0800, Wei Deng wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit 8b9fd78478acacccd0cde109b4a3550969f33bbb:
>>
>>   Merge branch 'dsp-fw-kaanapali' into 'main' (2025-11-19 07:22:57 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/WeiDeng-weiden/qca_btfw.git main
>>
>> for you to fetch changes up to 94beae96027761e69a54603605b8a9bfd7b71b3d:
>>
>>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-20 07:24:50 +0530)
>>
>> ----------------------------------------------------------------
>> Wei Deng (1):
>>       QCA: Add Bluetooth firmware for WCN685x uart interface
> 
> Please don't strip parts of git request-pull output. I'll add it back
> for you:
> 
>  WHENCE              |  39 +++++++++++++++++++++++++++++++++++++++
>  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
>  qca/wcnhpnv21.301   | Bin 0 -> 6876 bytes
>  qca/wcnhpnv21.302   | Bin 0 -> 6876 bytes
>  qca/wcnhpnv21.309   | Bin 0 -> 6884 bytes
>  qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21g.301  | Bin 0 -> 6716 bytes
>  qca/wcnhpnv21g.302  | Bin 0 -> 6716 bytes
>  qca/wcnhpnv21g.309  | Bin 0 -> 6716 bytes
>  qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes
> 
> And I've added it because I wanted to ask. Why are adding both files NV
> ramdump files with .NNN and .bNN extensions? The former ones won't be
> loaded by the kernel.
> 

Thanks for posting the complete request-pull. Uploading .NNN and .bNN 
files is to keep them consistent with the current UART interface NVM 
ramdump file, we update same files with hpnv.NNN and hpnv.bNN.

> 

-- 
Best Regards,
Wei Deng

