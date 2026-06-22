Return-Path: <SRS0=CvfH=ES=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8A9CDB46F
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 14:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B20B1F00A3A; Mon, 22 Jun 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782137207;
	b=gZd6I2EEigE6EwWZLfKiklA/4hbuyzn4iYYN8dDxYTQoX+zui3nm5r9APVjd3B6nIn8o
	 Pnn24jxoC621VG1US5HgUV6oiAWzqk3S0aj+y5N3AGiDihePCnYpzVIoHpcJbJMMeocHc
	 9hQoowLxZc6DXcoAtV/LmqSI2iNiCaCwSchhH8OZ8nPHDhnkbUI6o2xEeOr5knogxI8LY
	 BOHpXzXlBPEZHP7dKY2K5Q+sSYuo5otrKVxxz8uUju9pg7U+TCsv9FIxAxLaKSa69knBP
	 XZEFtSpukGi38Sr9O4+8GZwaogIKi1MJK9PSET7iRUE8+dWulnzItQnfBa5Yn0XQjqw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782137207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LOi2gopN7Aff6DuTE6S67mYt8pMFqWVUZPwPFt4MLhg=;
	b=NJMoAS4JkU7dyuF0/oN3iqLyehJYz4fORZPuBwU3QBicZwTkE8wEiYzK2WFiPVkuPAT/
	 CbZQ553outFMvvO5EjtYJOA3INAsJlgDAsKCztft8z/9CYDhj2s+f9ZmZO2/zlzDsoXVG
	 AWH651hcg0rK2iiaDcotEELPTER/DHuoxQ5ebh6BHtp6r3yElkmOOyzUkvCSvlRlUubl3
	 rX3OsNIU4+D525X88MAMKrd6D6/sk5+ofKK/ECDSjI7HjYSZha3vw9TcTYn/XVl5Nh2gY
	 cVTV7NqMR1z1xTarjAudVFsErOPXhba6cEQTRF/WonynyI0Glpn4A8gQAXSkHN3wzDw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsP3D9ka;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yl81vv/k";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4DB31F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsP3D9ka;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl81vv/k
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D4DB31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGDCE1283778
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 14:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LOi2gopN7Aff6DuTE6S67mYt
	8pMFqWVUZPwPFt4MLhg=; b=MsP3D9ka3aTnY7S5ESeNEvT3iLIg1Zxn9BltnZ/c
	Ln8073tHuoKPOJSMl0KZAJO3+atcqGOBHJg9EAQ/3/0hilDXG7bHds4KDlrCmMsi
	pzFfkfy23BUbzHO2QcM0gb0nzp4VKotZxUHkqWNjpSTllVZTqzXX7KffEiFpYINw
	d/3urd6ZFa+SXtKJOF+LslRNf2BUmgM9mJpXKAUPtJaqT0LEVu+xBPGrDphnNg8Q
	Ebax8gjhsXXWxhNblYWwCJDSLdV3wttm8qL5zWO/DkQYpe2ocSNSjvQiukxnSOAl
	c6p0v9ZfNjNADYGCwXFSGH+m9wqKBQYBtMBRhHe9wjkb8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n406u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 14:06:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so2741981a12.3
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 07:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782137204; cv=none;
        d=google.com; s=arc-20240605;
        b=W6JR0oqE5ZZfFrkG4pvgZ6InBvFPfSKAsya7g46Pn0DUk0I50+FCVYuGqdsrmdFxtq
         gsL+SiOW4YLRsX+sqqd4+NVopg94Zx8Jl7ovALrgU3yZubmz7C+7DWS7reqb7aOuvs9f
         LCFfEsYPSgug5hBKf8lZVriw30gfrtyPOjZECX0Q4mRk5fT778apEavw+tnUUuDaUcDD
         a9HQWXIATSS3hH2CHkkkLm8zUPKQl3AKY9+CqGLL+M8hFv2gsWi1Un1pz41VvFmvTxFm
         D9jJ/fBRODjc1TSKE73gLuD2AP2wPkVLiTWBBbsmb0sqzYf4bOSBnBGiPQmpLsTfWABY
         cuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LOi2gopN7Aff6DuTE6S67mYt8pMFqWVUZPwPFt4MLhg=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=GYntUZaRVpA004KXKBedb6fCrMH1D8MwX2HS1+rATGs2ujHUY35f8gEjlZzXomPI7d
         JNCjCOtxv8CEqCU+EW9UJKZSkhq3mZRKJGtCptp2c4SVD3Uu45xvin98gzFGlpgECmOU
         epdfOIka819/lVmAnKufjYk0S1KR9KD6cl3UWKX5C5+6miEvKt/gkqhQYU8cf4RK3aG3
         Ui+qEEgd9iscgl5aYoe7AYVgo9CGf44zvQY0fGexb1zk7q69FqJh3KtmQGkP6BD3Futx
         LILu1Lwu+Gcree7cXa+1z+w19lHAGG5dR+Pt7zyveVpdWr9dVoI0MfcXqfYdx0OFVc1J
         UnCw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782137204; x=1782742004; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOi2gopN7Aff6DuTE6S67mYt8pMFqWVUZPwPFt4MLhg=;
        b=Yl81vv/k5zHEHjQsfAHrlW+/lHJR44RItp4a+BHFRNOsiVrrdArpn2UxaOp3bSM88V
         QX7p7VxGX4HAqEytmOUJKSZIwIB9VdYlZalkkfgZ9V+gkqNQltoMYdgkkw+DdipMRhhk
         3v8zMvGSG8wm/SVXzPtBMNMgMAQ826OSsSrZqWISe9Jgs+udCzg7NmZNH/uUtR12LlK/
         6LBEq7a0Yllbl78O2SFtPOY35eGCjTXtUr090soQIO4KIn4N63n7WIyfHFgP/V5M0oxU
         B+EkLqXlpyO4NOyZjMOOVVRIxHcabHDa+j8D0ubivc4LC5/XH+UEieFzDD+yE032qEAc
         iuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137204; x=1782742004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOi2gopN7Aff6DuTE6S67mYt8pMFqWVUZPwPFt4MLhg=;
        b=DIsSITnB1Qcd7PB8l5tiSmrKVmsNhZTkvMJc8cQ5nH61iV3I9xbK4601MfgibzZFiV
         hh5nXZpfh4iVQ5loxO7Q2fyneXjP+0JKCuCoRYOMnIKPbeD3gathLSFIzSIOGjEPVYsa
         juJ2S1lMoB9bEoyZh+vbJR/SixKRiLfIE/a7OISQm2kskrYjWaUFlwrVj5T0MWyEu4K+
         0Hus14bADZ2jBamAaDyutbt5bjx0Du3yUH7Be2mhnIN/TZZ9RogShGHMgzorDTVUonTu
         Yed5v8KbmZxWacP6I3+e8AxuOfqYzbtQ7GlDG0Ps1xrZPDFQkiaR4NOe/OGb19TLI5Xy
         skWg==
X-Gm-Message-State: AOJu0YwnkNJWgPp4izQkfJHcSdT9UWMimF4ui+YrIPTWjn8IzK1nh6N8
	HvNpDVMuL+PTl2QlPyfMC6bHyhR4fLPArc8QcaRSyvx4HLYDtMtXhGstX50ut7FNasR9rSYm9aT
	MQzm6HMpXlwlY1wmk0IVTdAv0AlvIRxRu0zrddEe2gF9JkR+IFpchgGJKvyyyxzCQf4lB2AqQ1B
	f0FGuGYmaowLAu8DKYBT0xX3vLxp0YZXmMZ5a8xg==
X-Gm-Gg: AfdE7ck9mCOxHIpwxlOFbrtiBXsudHqwDOOfL7FPYxeWl9C/bFYT2RmQZxGY84qKHfq
	VVsR0okAGNwX4jv1XXu985rJp7kAAVZoUhG27HzNMhUk60Mh8Ikj2NldWL7GI+lJhBFsSRRWsqo
	+QRxK0Yl8EQ588owGwPNRYPivJqiyj0Rv4nSIIHtWnP5ds3ZtCIsqdhERJvZqRyFTzATKyI7Y/O
	upo3ldCpwNxNaju8hYCE2yaUy65Rg==
X-Received: by 2002:a05:6a20:12d2:b0:39b:d937:8020 with SMTP id adf61e73a8af0-3bb35256563mr16234073637.42.1782137204390;
        Mon, 22 Jun 2026 07:06:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d2:b0:39b:d937:8020 with SMTP id
 adf61e73a8af0-3bb35256563mr16234013637.42.1782137203802; Mon, 22 Jun 2026
 07:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <59d7567e-913d-4aa5-b3a9-fe1f34c0a21f@oss.qualcomm.com>
In-Reply-To: <59d7567e-913d-4aa5-b3a9-fe1f34c0a21f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 17:06:29 +0300
X-Gm-Features: AVVi8CdncCMs-f2d5aVjB-y3fexiJWwVBeFq1UO9lw-bhfMqrnN_RktZEX6V2b8
Message-ID: <CAO9ioeV8kBGQofip=HnEst75ZP-OMiNj4Jgh9V2yRA1tic99Dg@mail.gmail.com>
Subject: Re: qcom: add LPAICP firmware for shikra platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfXxZ0s65BHBZ7f
 QHDG7yKfjqt2KvQopxEgG7y32ZhIH8Ho0yx7Xjf9jTtawNpZhMZFsEUNld84t7qxoxFimmYuRjh
 9ET3VNeP9sJSNhPAlZJM3/geQljmCxA=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a394175 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=An5l4juaxN0w6su-QnYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ndfb61UovGIA-DYsVZwTM2BnbsDY2mG1
X-Proofpoint-GUID: ndfb61UovGIA-DYsVZwTM2BnbsDY2mG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX7Yc7rGWB4VLg
 QHQIqJ6lURVYioRZaz4niZ0noUgoBKdoiYEkbIwb+5VpM+lPd6mzM6AZceaTx9xGo2fBfzST55n
 n3mbLLFbcVSr6PA99e9CQfoPIIzjuL9X3LbJg3s1pc8tTGdqz8TyoyyYVB3pi9aQ0Vf1eB4E+cS
 FZvM1QZen350UpO3Q4E68mmfQbIccRGNx+uCTGN37+Ur4nLr/qb9Uu2vniDxsVXRQkFxLMGVWoN
 vCielKyqUGPHub9MY0lm6SvJrTgTYl4ny+MknlxGLY/Es35IOrw1TTWJLWTvIdQbRqQokNnGSoR
 m3rGumxrD7yj5jCFxdqkoEc+xL98MOfuOLeICA71u/rtyM6KsTt1wxPUyxp9L95RNBcKVJVBXQ0
 FGeho8hKpZdMJQHaNhB3cGmvp/4eqwBBkLoEFPAJMQl6EU1cu9EIEsk+5MAreJGUvXJsoyjuR4b
 Qf+2niTsWTRagVdmOkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220139

On Mon, 22 Jun 2026 at 14:46, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>
>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> riscVqli-fw-shikra
>
> for you to fetch changes up to 85780e7449843c9b27c43329c30c203494502da2:
>
>    qcom: add LPAICP firmware for shikra platform (2026-06-22 17:11:27 +0530)

For some reason the robot didn't kick in. Merged manually and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1118

-- 
With best wishes
Dmitry
