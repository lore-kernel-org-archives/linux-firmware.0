Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6592B606A31B
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgkdmZUE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUAorwP7
Received: by smtp.kernel.org (Postfix)
	id 5861F1F000C6; Wed, 21 Oct 2026 11:59:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792583954;
	b=I6T/gKmgWnBNHeXIS0EfiKY2+5OJYo3d/PnVGWxRNUf11Z6YgT5eZpjt9QCnwF8KndqZ
	 TqJOYjUyBsJvjbMyg8uYd6joJbOoWIcZtniVg/M4or9LBNAcPYweLFys7Mscz+iNa7+OD
	 5bxjpzOGRDr+e4VdXaIzZuIKe9+Ytd7ObVw3e8kNVAM71KnCHmTfJJnkhbSKQGORMKKXT
	 Dw28IiOKnoquOP+7XnJM9qyjIb0kZWqXTzfFqLYsg/alziXHtCZZncq5rECec7/lNEQyB
	 yx5/EdRq9Aa70v2+CHAYz1QuytscyaqdH1bTBnH+Ou6jcCIObqlcO3epolzNh1BAFLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792583954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=anWGY0vJqkiLq+fHWt0hU5ooJmKyT+kShGS0ojkHzmE=;
	b=t2e+27gVFnXT2Mw8Go6VTQYG2HddXXbIPGwn1ZuT37GdIjowF9RGQz8MRAxAm/0fKLUo
	 D9UpGo3zacfgNrScprBiGX4GPM47CfYicS79H905r+sxzxI3dxNDfEIljRnOtpENQYPhW
	 FzP9hzxUQTOM1qwtHraVA+cVLzN8cv46sWhB88bmkzsrPrEte2trO8H88O3P6NZEtBa/E
	 aJPZ8qpjo5rBNy+ZpVYllP6nw6RuWFYvpF5c6JnfD/JXrmLT7oCe7/J9vykAk2/z9qkn+
	 jUopuDhfKAzoOn8Oz+rpGdIp5iGTmuQ3YFUdw8RvIyKI1R9VIvQSMm5HRbaFWgvbtvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgkdmZUE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUAorwP7;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A399C1F000C4
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgkdmZUE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUAorwP7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A399C1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg9JA1054287
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anWGY0vJqkiLq+fHWt0hU5ooJmKyT+kShGS0ojkHzmE=; b=YgkdmZUEeqpmZ5OP
	P+PRzL26kuz9wrxZ1KsBhUvjK8c355rXHf48Ucn1LjnCLzNy5gEueJJjbMNnfLhu
	VEEhofjadnhHK5ceZXA2Fgo94/NYiaTjogax2ZQcDMTa7UolOK1yTwNj8/p85vmQ
	X3qo/WCU45HpzMfRAedccsbIFan5vP43qkKq0a+wFQNRwbsmWVYcSvK9IbCwxJOX
	giecjyjnasZk4f5hvmUdrIOUhV/Ug9Qs7jQ2EaqG89qdT8hXwM349rIyhE2OX+ze
	I7oxG6HIsKrPVfqS2rgLPpa6D5A9tO0SZwpjbUbzTpCsAucOytnUVqwPwhFWM3we
	sljHAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkr9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 11:59:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53664911d46so21770291cf.3
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583952; x=1793188752; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anWGY0vJqkiLq+fHWt0hU5ooJmKyT+kShGS0ojkHzmE=;
        b=NUAorwP74gK/B/9Vlgf9+jUiaJgbdsyxmETJrl8OEn/pnMUDg4V1lb7Xa180MBBxFv
         2yJT6nUpGrWXszKE8XzQD8bvV1heFiXsSRexovEH4gdW+jsg37QeAoOYhpLVRsQ/ya2G
         dtE6cAa1WuMdGjh+xYk4y04JT+HL8LSHx+qA78Iv6wNIlOFXX06Uqh0IeqA+9J0X3MPu
         zuaQQhUHCpaSB8c/rtnW6c/r4G5tCZI9/ZpGjhdxlsfK6jkUk0ZLy42r8PD+94VWoulh
         QsRhWAUOhqSXIeHjiHprOI12kL1078qoKKI+24QCvouEjKftYP265p8t6N8FF7pnq4FM
         7Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583952; x=1793188752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anWGY0vJqkiLq+fHWt0hU5ooJmKyT+kShGS0ojkHzmE=;
        b=07m0Von4tPKl8LN69ni3+46m/OI3CvME01yd4j2ZEWtj13+guAnZ4Bq3LMc3BV3NQY
         t67kl1xwFCVE62ICjg5eQkmp+S1iDvI//DuDFscrNaJOrhSUXMu+3Dmp26i4nRVuctiu
         EJiZuvVXKudzIBODEQkTZ8Pg+FCL/QeNLWc7znrkh2qnT78YTx6ukvx3lHqAiLGJ3Exl
         jDTbAH9cEZyvPiNjewwB7FKLNtJGeTj+BFplc0mWpuiFLRdHIb+SbDZa1ZTqc9OCTBE2
         Rc9klyXdmK6t6FnBtfP3SUiip+QmlTQaq0IkceBSV50xvEZ0fCFiqL/HRgQ+9qxTtKfy
         T39w==
X-Gm-Message-State: AFq9FYLzVx7pgN6eB8ZVySlEyk5RnX9W6uCRGNxV4pF9XjAXYKH6oFtT
	+xW0l0IO73s4S+oNcbS8HwYsRiNmaGyjq0ssHgXFt37cys7Tik/i8xA3R4JpOu1Az1BxJH7tafA
	D5WphXF3LTTcAdjbT5wI3g2su2zthHOBnWWrZgSvRvYxETeEg19rGeVCJlsfn5j4fv0H6lBc=
X-Gm-Gg: AYBFou3AJwfljUzdfVeSD0DicmR8L+nV+GIELDGZqkeEChA3MxuG7ipSP8HqgWjbviG
	s2ltAJRR96ROeuU26Bkd19d7KSdg1k6a8BM5opevlklpGyxhoAvSjHT7XPH65C2LuWLFJ0yQhin
	di33IWU+wvwH1h8z3G8IdHfzZylTjN5eNCCI+Z+6dTN15Ds3yDgmytYf7xdRmJHoKlKfagtHf/o
	YX5EwrC0joq5JQ/QwFwJEhyAL6cPwrMcq8E7ZXNW6NvHpk/HuEpTh1nRV65f31DmfyJOvrYqZjf
	W2KR0dFz8IzmpxK+0lD1gDcZAB7q1MNwlN/17cPxFpzGdSLjXs74ZI0YgIIKe89jW/FVL3ZX1K1
	xrkmLR1lPPxm2trajT15ugg5jgt/dg4Sx/OjBHUdcI4EoX/UTBirGetGK1g==
X-Received: by 2002:a05:620a:84c9:b0:93e:d7f0:497a with SMTP id af79cd13be357-93f57f1ecffmr345275585a.16.1792583951890;
        Wed, 21 Oct 2026 04:59:11 -0700 (PDT)
X-Received: by 2002:a05:620a:84c9:b0:93e:d7f0:497a with SMTP id af79cd13be357-93f57f1ecffmr345272185a.16.1792583951452;
        Wed, 21 Oct 2026 04:59:11 -0700 (PDT)
Received: from [10.111.174.166] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56df222dsm235406085a.26.2026.10.21.04.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:59:10 -0700 (PDT)
Message-ID: <0ac5a97e-02e7-4c55-9c89-e7a6f14da426@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:59:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Update Bluetooth QCA2066 firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
References: <7849e6c2-9524-4e74-8800-0fce2c60705f@oss.qualcomm.com>
 <zoqzckdyfvz3uupspi55oforrtaj3gw5wturvg7pw3ppoihnvn@nxvqlqgdbjck>
Content-Language: en-US
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
In-Reply-To: <zoqzckdyfvz3uupspi55oforrtaj3gw5wturvg7pw3ppoihnvn@nxvqlqgdbjck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX2BpHrPQOb5mu
 VyCvcol3z6N56u68dEgrCE/ACnTS0cclW+85YErbHcDJDOEer/xzq33soe90D/4yuZ5U92DVhMl
 FZt7Nn3jm1hgYmjXDFziCogoSIiN2xpZoE9qvFpv3Ng4uwH/xI8ta+CWfcGwTU4VVMT1hAnDgUR
 XSxsI1dIb8+9jkBjtR3J5xVvsjtsjdhW5daVRl2rTzHKUp9LupQGnAC9lPFHbd3Yg1rru8o+Qzf
 hEw0Zf73ryCPI09svsQ8hJzh335QIg9XT3Ng3WTn2FzmdJ9kxDrrGqAwnXOxy8HrQGoOitZAYKF
 JhY+Xlum+HNEq8tdB1aZerutivv7kpNL+vwxyJemeCC7W/lKYufFJkNW1mC7G2NnvGt8qtcMv7l
 /Z9FQYue1HXUxvW0v38f3qFpMv1ocoxo4dwannLC04CS3+VtbOtUSQWXmpI0jTFmhsfgmR1igB3
 xdYMZkrvEN8T/56p95w==
X-Proofpoint-GUID: yp9TUxsUCD7F-Rf5QR2XK-uTVyUhd5Ls
X-Proofpoint-ORIG-GUID: yp9TUxsUCD7F-Rf5QR2XK-uTVyUhd5Ls
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXy6Er5LH/M7Sm
 98L1C3/J3Hg37yCoDOXEzFtbmbBnNr3TKdmO9QaaKEt6xtlor9CNvChkfH2XQL7BPazpduqPX1C
 vZfTcyi79fwjLQCk9VucWiOqVBzd7Bo=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8a910 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=cZLdp07Bubwv8fkto34A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/2026 7:26 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 06:35:59PM +0800, Jinwang Li wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btfw. Please let me know if you have any problems.
>>
>> The following changes since commit 9a80a04181713da7f8187ec928c15160137f3262:
>>
>>    Merge branch 'robot/patch-0-1792477420' into 'main' (2026-10-20 12:07:53
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/jinwli-qc/linux-firmware.git update_QCA2066
>>
>> for you to fetch changes up to 7fcdd92bd8c7d2a57500702609059ffe03407743:
>>
>>    QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680 (2026-10-21 18:22:48
>> +0800)
>>
>> ----------------------------------------------------------------
>> Jinwang Li (1):
>>        QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00680
>>
>>   WHENCE                                   |   4 ++--
>>   qca/QCA2066/nvm_usb_00130201_030a.bin    | Bin 6917 -> 6917 bytes
>>   qca/QCA2066/nvm_usb_00130201_gf_030a.bin | Bin 6749 -> 6749 bytes
>>   qca/QCA2066/rampatch_usb_00130201.bin    | Bin 160124 -> 163332 bytes
>>   4 files changed, 2 insertions(+), 2 deletions(-)
> 
>  From your diff:
> 
>   Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
>   
>   File: qca/hpbtfw21.tlv
> -Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
> +Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
>   File: qca/hpnv21.bin
>   File: qca/hpnv21g.bin
>   File: qca/hpnv21.301
> 
> But you are not changing those files. Please correct and resend.
In the current linux-firmware, the actual firmware versions are:

qca/hpbtfw21.tlv: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
qca/QCA2066/rampatch_usb_00130201.bin: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3

However, the versions of these two firmware files were mistakenly 
swapped in WHENCE.

This patch corrects the version information in WHENCE and updates the 
QCA2066 USB transport firmware.
> 
> 
>>
>> Thanks,
>> Jinwang
> 

