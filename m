Return-Path: <SRS0=vtut=5P=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C083CCFA05
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Nov 2025 06:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3681C19421; Fri,  7 Nov 2025 06:49:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D82BDC113D0
	for <linux-firmware@kernel.org>; Fri,  7 Nov 2025 06:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D82BDC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73MHCc1864376
	for <linux-firmware@kernel.org>; Fri, 7 Nov 2025 06:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBliZ8rp0P7SUFTPED86VMB8sV8OWPvQBIF1E9eQayc=; b=lVxQiazvyCXlcEKj
	jCzfIjMjrYHgH9zPglIn0Im37e+Et0pmahJqYNm5z3PNk3e0Cc88rAR9QvWr/BkT
	qFRpk3m7aE2L4O0ofJtnZ6pbBl80/7+9U+sZxUOiI0am7tXOV57BIENprI6XA77u
	JUV2HobVHYAQbx0mchgKN3gEmyILsY5qHmnEeB0GS3vHMsSVSGzGRX1Z2gzh8mLV
	/KhMcW38rmqXyU81jDl+8UG1z7oXHjrk/QE//zu02MPV7SL5xPPDZjHmvrogBPhH
	2mTldc6VbMVWAAIcscoPICcfIqkKEByGL9ITXNzHRDieqiWTZeAh7XLQA2ZvFoEr
	lw2Ldg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta0ff5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 07 Nov 2025 06:49:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3409d852a5bso182264a91.3
        for <linux-firmware@kernel.org>; Thu, 06 Nov 2025 22:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762498163; x=1763102963; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBliZ8rp0P7SUFTPED86VMB8sV8OWPvQBIF1E9eQayc=;
        b=gd8bdpcZA3xQhgTs4UDkGRjsxEkkEs1l977YjOUPBTy3Bx9TPSCGlhVbYxbaMUfMRP
         yGa1fXQDm52LgsSXLnKY6EQKmgl6qpEmfVkvBtBmO+PeuUzk5xcEIokOV2VYvI8FBiqC
         ZB/EowzfeQ8CLkDNBYlm5PsnKCv4HaUaHjpsuWgpLUbvkNn01h5tptiRzEPlaudcLNqz
         HiwZRm/6CJY4MpHidZbHJhdmddlxlN9WDsE+vzouGxSLYpRewydE7PDcAyGVi2sGsGA9
         XegloJv1+edaQYEf4vVxe0XHNfUWJQBZE6nNX1+66JC+aTTvJt/2Y3Ck81Vb5gY1IgtB
         FJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762498163; x=1763102963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBliZ8rp0P7SUFTPED86VMB8sV8OWPvQBIF1E9eQayc=;
        b=ASw14ZDnL5JLms34YNZDuKmUT/oEfhtaGK1AqYF4Qiw+UgH2RSmDqUVXOmVD8KTFn9
         AP6bVpIAwVHpIkQoktKvleby2kK2cmjlAk0LpmRaKl7bC3PHlnmQOQq28byXDGedQM3m
         U4bsvmgRzI0kBEP/Rj8o9nxqruS6xO599F7qZpWVd/RGQ63gVeBhSoQ0wrMBLQgOJXFU
         BSnj30JvXNmY2d1JNBoyIY8sPHIWU3r55rijpmTpYG+mTa0j1QOzMNaBhXGh7L0y/XDq
         dmj7pvvkd2JL84rGU3iibd6/lCiSVpjOb3vISJSeLQbYmO7HqT8kY+dwu65NgyBomzZg
         vIdg==
X-Gm-Message-State: AOJu0Yy8KlS0fCeOCARmsZyDheGkbAXO34o9HaZMFoFaZQyj913zZqN/
	JtYEfb2AB0KYMmONEAXL3U3BpRe9GLmE/g2OciJTx/rAgjz74J4UGBi8Khmpehsls82nyYi5Eh7
	TUZLoiVZyorilNr/G4/t4zwU/tvuxbkKRYmgqrxjL4Sbk6czqGgm0OT8Eii8GOZs=
X-Gm-Gg: ASbGncsOw2dn1emMGuygaglpy3s3sA0sezNUDQChcs9D6EfaQ4to08BcL3OX9SX7f0A
	qLHvrJjpc2Om1W+B1kEeWB+JigHYx11TSylpFCvWukhvD+11mk7v//BVNh3V8lB0Eu+0+1rjzdB
	whbcbiB3B4gTjpVME6D26id3rkJ06uY35+IZR4G1g+QuVu13AsRAOhYIdngVRISpQOkxPG3Ukyh
	k9ubMReQaER98Z5OSLXmaKiS13jyhj7Hll+cbHAhUXe/x0aYw60mDAVrttNpgErKcSbNxVTbUaW
	qCLVf9elxESQWXfEBk+aqg2oheLtdR2bSP0xwmPXG3/azuZLT/DUaNhetDB3p68ix3SAasERMxL
	InSpOIuZ0j+L23kWqCwaneKynCb89+k82hkXFC6hAnUd7HGhjMZBSybavs0VPeebmQw==
X-Received: by 2002:a17:90b:3149:b0:332:50a7:af86 with SMTP id 98e67ed59e1d1-3434c4da2e8mr1357310a91.1.1762498163166;
        Thu, 06 Nov 2025 22:49:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9LRCctJGDoBUSpYwkHWm8yrvLEH68/Vtc9FWNl+H9+uATd4t78Oy1XqLFhLeTfM9q9131sw==
X-Received: by 2002:a17:90b:3149:b0:332:50a7:af86 with SMTP id 98e67ed59e1d1-3434c4da2e8mr1357295a91.1.1762498162737;
        Thu, 06 Nov 2025 22:49:22 -0800 (PST)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d1375e70sm2270136a91.5.2025.11.06.22.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 22:49:22 -0800 (PST)
Message-ID: <c3b78121-b9a9-4589-b532-37e273ee2959@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 14:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, jiezhang@qti.qualcomm.com,
        chejiang@qti.qualcomm.com
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
 <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
 <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
 <47006197-ef93-4199-8532-b8599fc82248@oss.qualcomm.com>
 <misqbrwxgfsw26lsnc2blorzn44m6wyrrstfzeursprq37uc7s@brxihrq2jc7n>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <misqbrwxgfsw26lsnc2blorzn44m6wyrrstfzeursprq37uc7s@brxihrq2jc7n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA1MiBTYWx0ZWRfX/Gl+GQPw1Kq4
 WVQfWOY7w2lZMQh0LtZpEap8BtpQHGhiKtdm77VuQQ42ylmxpSEhn5+SlhSuMNrPwYJsFxnFrPs
 RIBbyjBscouw79jvc6UP6pFg3MvpITmk8SwzkiZ0cOR3CR/eye2HDUEV8hRNuCnybs5dPf9oPwh
 tTLrFNOQPIoN7A1zWRS3RIFL1/4t4TpjZtqgp2p7lLi8smBj+h3JGliNGqTNv0QCQL0Zz4bsMUx
 dqpYg1Of3/ki6SautCQrMdyPcqOKZGzSaGqpEDWGB5b/5lj8cO2Bv2GrW9UBUbIDdPjvpYlWMI2
 EEf3f4Bblc2UEZ1v9BnvcbvJd/e0/7COqO5awZzQypRmGwTPRiaRuBfMXG6PN6PCQmi3abnlJLb
 2W4AhJy1DjiMUztvGY9iLEIQcRptsw==
X-Proofpoint-ORIG-GUID: gumWEDipMaFipb49oWuTfDBbKrKxlARu
X-Proofpoint-GUID: gumWEDipMaFipb49oWuTfDBbKrKxlARu
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690d9673 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p47JNI5B4IskYb7AKLgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070052

On 11/5/2025 7:48 PM, Dmitry Baryshkov wrote:
>> Risk:
>>    For QCA2066, there are no up-streamed DTS currently, customers we known does not specify
>>    firmware path in their down-stream bluetooth DTS node. For this solution, customer don't
>>    need to do anything and have no risk for them. and they still download same firmware
>>    as before.
>>
>>    The only scenario this solution impact is that current default QCA2066 firmware path
>>    qca/ is specified in their down-stream bluetooth DTS node. this scenario should be very
>>    *Rare* because current default path is qca/ already and they should not specify this
>>    default patch qca/ in their down-stream bluetooth DTS node again.
> First of all. We all are bound by the backwards compatibility. Newer
> kernels work with older DTs. Newer userspace works with older kernels.
> Newer kernels work with older userspace. Etc. As a part of
> linux-firmware we try to ensure that by providing backwards
> compatibility and relevant symlinks where possible and sensible.
> 
> As such, running older kernel with the newer linux-firmware on the
> hardware equipped with QCA2066 is expcted to continue to work. Yes, this
> is against your customs, but there is no SP, no customers, no service
> releases in that phrase. I didn't even mention the DT.
> 
> As such, the list of possible solutions in (my) order or preference:
> 
> - Rename firmware used for WCN6855. Use qca/wwbtfwNN.tlv and
>   qca/wwnvNN.bin. Use any other prefix instead of ww. Then update the
>   driver, taking a look for qca/ww firmware and if it doesn't exist, and
>   fall back to loading hpbtfw if newer one isn't there.
> 
>   This way all existing devices will continue to work with the existing
>   firmware files. Older kernels will use old firmware files which are
>   still compatible with both QCA2066 and WCN6855 devices.
> 
> - Add new version of WCN6855 firmware under qca/WCN6855/ subdir (why?
>   Subdirs up to now were used for firmware files for the same chips with
>   different RF parts). Then update the driver, taking a look for qca/ww
>   firmware and if it doesn't exist, and fall back to loading hpbtfw if
>   newer one isn't there.
> 
>   This way all existing devices will continue to work with the existing
>   firmware files. Older kernels will use old firmware files which are
>   still compatible with both QCA2066 and WCN6855 devices.
> 
> Compare this to your solution:
> 
> - Move QCA2066 firmware to the new location. This requires updating of
>   the existing kernels to follow the new path. It can be done as a DT
>   modification (less preferred) or as a driver modification (more
>   preferred). Anyway, using the old kernel with new linux-firmware will
>   be broken on QCA2066-equipped devices.
> 
> After doing this analysys I see no arguments in your email to prefer
> your solution to the previous two.

make sense. thank you for detailed explanation. (^^)(^^)
